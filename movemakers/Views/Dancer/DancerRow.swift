//
//  DancerRow.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct DancerRow: View {
    var dancer: Dancer
    
    var body: some View {
        HStack {
            dancer.profilePic
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(dancer.name)
            
            Spacer()
            
            if dancer.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let dancers = ModelData().dancers
    return Group {
        DancerRow(dancer: dancers[0])
        DancerRow(dancer: dancers[1])
    }
}
