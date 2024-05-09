//
//  DancerDetail.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct DancerDetail: View {
    @Environment(ModelData.self) var modelData
    var dancer: Dancer
    
    var dancerIndex: Int {
        modelData.dancers.firstIndex(where: { $0.id == dancer.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            
            CircleImage(image: dancer.profilePic)
                .padding(.top, 130)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(dancer.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.dancers[dancerIndex].isFavorite)
                }
                
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
    let modelData = ModelData()
    return DancerDetail(dancer: modelData.dancers[0])
        .environment(modelData)
}
