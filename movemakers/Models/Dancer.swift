//
//  Dancer.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import Foundation
import SwiftUI

struct Dancer: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var nameOrig: String
    var imageUrl: String
    var pronouns: String?
    var bio: String?
    var dateOfBirth: String?
    var nationality: String?
    var basedIn: String?
    var instagram: String?
    var youtube: String?
    var agency: String?
    var contactEmail: String?
    
    func image() -> Image {
        if let uiImage = UIImage(data: try! Data(contentsOf: URL(string: imageUrl)!)) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "person.fill")  // fallback to a default system image
        }
    }
}
