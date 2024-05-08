//
//  Dancer.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import Foundation
import SwiftUI

struct Dancer: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var bio: String?
    var dateOfBirth: String?
    var nationality: String?
    var basedIn: String?
    var instagram: String?
    
    private var profilePicName: String
    var profilePic: Image {
        Image(profilePicName)
    }
}
