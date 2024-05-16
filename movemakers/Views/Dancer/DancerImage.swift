//
//  DancerImage.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/16/24.
//

import SwiftUI

struct DancerImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    var imageUrl: String

    var body: some View {
        Group {
            if let uiImage = imageLoader.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .onAppear {
            imageLoader.loadImage(from: imageUrl)
        }
    }
}
