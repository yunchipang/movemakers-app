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
        List(viewModel.dancers, id: \.id) { dancer in
            NavigationLink {
                DancerDetail(dancer: dancer)
            } label: {
                DancerRow(dancer: dancer)
            }
        }
        .navigationTitle("dancers")
        .onAppear {
            viewModel.loadDancers()
        }
    }
}
