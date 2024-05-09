//
//  DancerList.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI


struct DancerList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredDancers: [Dancer] {
        modelData.dancers.filter { dancer in
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
    DancerDetail(dancer: ModelData().dancers[0])
}
