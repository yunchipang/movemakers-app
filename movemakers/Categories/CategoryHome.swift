//
//  CategoryHome.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/11/24.
//

import SwiftUI


struct CategoryHome: View {
    var body: some View {
        NavigationSplitView {
            Text("hello world!")
                .navigationTitle("featured")
        } detail: {
            Text("select a dancer")
        }
    }
}


#Preview {
    CategoryHome()
}
