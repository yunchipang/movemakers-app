//
//  CircleImage.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI


struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}
