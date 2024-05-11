//
//  ContentView.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dancerViewModel = DancerViewModel()

    var body: some View {
        NavigationView {
            DancerList(viewModel: dancerViewModel)
        }
    }
}

#Preview {
    ContentView()
}
