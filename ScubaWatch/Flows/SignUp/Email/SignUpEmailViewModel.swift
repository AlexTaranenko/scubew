//
//  SignUpEmailViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import Foundation

class SignUpEmailViewModel {
    
    enum SignUpError: Error {
        case nameEmpty
        case emailEmpty
        case emailValid
        case passwordEmpty
        case passwordValid
        
        var description: String {
            switch self {
            case .nameEmpty: return "name_empty".localized
            case .emailEmpty: return "email_empty".localized
            case .emailValid: return "email_valid".localized
            case .passwordEmpty: return "password_empty".localized
            case .passwordValid: return "password_valid".localized
            }
        }
    }
    
    var signUpModel: SignUpModel?
    
    init() {
        self.signUpModel = SignUpModel()
    }
    
    var isActiveButton: Bool {
        guard !String.checkIsEmpty(signUpModel?.name) && !String.checkIsEmpty(signUpModel?.email) && !String.checkIsEmpty(signUpModel?.password) else {
            return false
        }
        return true
    }
    
    func checkValidFields() throws {
        guard String.checkField(signUpModel?.name) else {
            throw SignUpError.nameEmpty
        }
        
        guard String.checkField(signUpModel?.email) else {
            throw SignUpError.emailEmpty
        }
        
        guard signUpModel?.email?.isValidEmail() ?? false else {
            throw SignUpError.emailValid
        }

        guard String.checkField(signUpModel?.password) else {
            throw SignUpError.passwordEmpty
        }
        
        guard signUpModel?.password?.isValidPassword() ?? false else {
            throw SignUpError.passwordValid
        }
    }
}
