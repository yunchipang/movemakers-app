//
//  DancerList.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct DancerList: View {
    @ObservedObject var viewModel: DancerViewModel

    var body: some View {
        List {
            ForEach(viewModel.dancers, id: \.id) { dancer in
                NavigationLink {
                    DancerDetail(viewModel: viewModel, dancer: dancer)
                } label: {
                    DancerRow(dancer: dancer)  // ensure DancerRow can display necessary information
                }
            }
        }
        .navigationTitle("dancers")
        .onAppear {
            viewModel.loadDancers()
        }
    }
}
