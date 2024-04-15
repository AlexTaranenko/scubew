//
//  UserModel.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

struct UserModel: Codable {
    
    let id: String
    var email: String?
    var name: String?
    var phoneNumber: String?
    
    init(email: String? = nil, name: String? = nil, phoneNumber: String? = nil) {
        self.id = UUID().uuidString
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
