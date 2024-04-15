//
//  SignUpModel.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import Foundation

struct SignUpModel: Codable {
    
    var name: String?
    var email: String?
    var password: String?
    
    init(name: String? = nil, email: String? = nil, password: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
    }
}
