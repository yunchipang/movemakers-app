//
//  DancerList.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI


struct DancerList: View {
    var body: some View {
        NavigationSplitView {
            List(dancers) { dancer in
                NavigationLink {
                    DancerDetail()
                } label: {
                    DancerRow(dancer: dancer)
                }
            }
            .navigationTitle("Dancers")
        } detail: {
            Text("Select a dancer")
        }
        
    }
}

#Preview {
    DancerList()
}
