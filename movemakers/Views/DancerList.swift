//
//  DancerList.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI


struct DancerList: View {
    @State private var showFavoritesOnly = true
    
    var filteredDancers: [Dancer] {
        dancers.filter { dancer in
            (!showFavoritesOnly || dancer.isFavorite)
        }
    }

    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("favs only")
                }
                ForEach(filteredDancers) {dancer in
                    NavigationLink {
                        DancerDetail(dancer: dancer)
                    } label: {
                        DancerRow(dancer: dancer)
                    }
                }
            }
            .animation(.default, value: filteredDancers)
            .navigationTitle("Dancers")
        } detail: {
            Text("Select a dancer")
        }
        
    }
}

#Preview {
    DancerList()
}
