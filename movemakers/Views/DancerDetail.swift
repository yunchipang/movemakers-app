//
//  DancerDetail.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct DancerDetail: View {
    var dancer: Dancer
    
    var body: some View {
        ScrollView {
            CircleImage(image: dancer.profilePic)
                .padding(.top, 130)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(dancer.name)
                    .font(.title)
                
                Divider()
                
                Text(dancer.bio ?? "No biography available")
            }
            .padding()
        }
        .navigationTitle(dancer.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    DancerDetail(dancer: dancers[0])
}
