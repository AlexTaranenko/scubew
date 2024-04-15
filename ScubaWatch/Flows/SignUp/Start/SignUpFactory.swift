//
//  SignUpFactory.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import Foundation

class SignUpFactory: Factory {
    
    func createSignUpScreen() -> SignUpViewController {
        let signUpVC = SignUpViewController.instantiate()
        return signUpVC
    }
    
    func createSignUpEmailScreen() -> SignUpEmailViewController {
        let signUpEmailVC = SignUpEmailViewController.instantiate()
        signUpEmailVC.viewModel = SignUpEmailViewModel()
        return signUpEmailVC
    }
    
    func createConfirmEmailScreen(_ signUpModel: SignUpModel?) -> ConfirmEmailViewController {
        let confirmEmailVC = ConfirmEmailViewController.instantiate()
        confirmEmailVC.viewModel = ConfirmEmailViewModel(signUpModel: signUpModel)
        return confirmEmailVC
    }
    
    func createLogInScreen() -> LoginViewController {
        return LoginViewController.instantiate()
    }
}
