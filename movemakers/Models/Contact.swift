//
//  Contact.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/16/24.
//

import Foundation

struct Contact: Hashable, Codable, Identifiable {
    var id: UUID
    var type: String
    var name: String?
    var email: String
    var phone: String?
    var agency: Agency?
}
