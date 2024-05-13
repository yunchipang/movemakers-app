//
//  Crew.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/13/24.
//

import Foundation

struct Crew: Codable, Identifiable {
    var id: UUID
    var name: String
    var bio: String?
    var basedIn: String?
    var foundedIn: Int?
    var styles: [Style]
    var instagram: String
    var youtube: String?
    var website: String?
    var isActive: Bool?
    
    var homeStudioId: UUID?
    var leaders: [Dancer]?
    var members: [Dancer]?
}
