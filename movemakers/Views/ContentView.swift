//
//  ContentView.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dancerViewModel = DancerViewModel()
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case find
        case profile
    }

    var body: some View {
        TabView(selection: $selection) {
            
            NavigationView {
                DancerList(viewModel: dancerViewModel)
            }
            .tabItem {
                Label("list", systemImage: "list.dash")
            }
            .tag(Tab.list)
            
            NavigationView {
                FindView()
            }
            .tabItem {
                Label("find", systemImage: "magnifyingglass")
            }
            .tag(Tab.find)
            
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("profile", systemImage: "person.fill")
            }
            .tag(Tab.profile)
        }
    }
}

#Preview {
    ContentView()
}
