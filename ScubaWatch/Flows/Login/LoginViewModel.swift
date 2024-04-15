//
//  LoginViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

class LoginViewModel {
    
    enum LoginError: Error {
        case emailEmpty
        case emailValid
        case passwordEmpty
        case passwordValid
        
        var description: String {
            switch self {
            case .emailEmpty: return "email_empty".localized
            case .emailValid: return "email_valid".localized
            case .passwordEmpty: return "password_empty".localized
            case .passwordValid: return "password_valid".localized
            }
        }
    }

    var email: String?
    var password: String?
    
    init() {
        self.email = nil
        self.password = nil
    }
    
    var isActiveButton: Bool {
        guard !String.checkIsEmpty(email) && !String.checkIsEmpty(password) else {
            return false
        }
        return true
    }

    func checkValidFields() throws {
        guard String.checkField(email) else {
            throw LoginError.emailEmpty
        }
        
        guard email?.isValidEmail() ?? false else {
            throw LoginError.emailValid
        }

        guard String.checkField(password) else {
            throw LoginError.passwordEmpty
        }
        
        guard password?.isValidPassword() ?? false else {
            throw LoginError.passwordValid
        }
    }
}
