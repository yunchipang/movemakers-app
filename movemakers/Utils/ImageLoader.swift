//
//  ImageLoader.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/16/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil

    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
}
