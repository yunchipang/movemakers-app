//
//  Agency.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/16/24.
//

import Foundation

struct Agency: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String
    var website: String?
    var instagram: String?
}
