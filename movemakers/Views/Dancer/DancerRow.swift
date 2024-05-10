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
            dancer.image()
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(dancer.name)
        }
    }
}
