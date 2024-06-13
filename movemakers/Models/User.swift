//
//  User.swift
//  movemakers
//
//  Created by Yunchi Pang on 6/12/24.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var email: String
    var username: String
    var firstName: String?
    var lastName: String?
    var disabled: Bool
    var id: String
}
