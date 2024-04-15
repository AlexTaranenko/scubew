//
//  SignUpCoordinator.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class SignUpCoordinator: Coordinator {
    
    var presenter: UINavigationController = UINavigationController()
    private let factory: SignUpFactory
    
    init() {
        self.factory = SignUpFactory()
    }
    
    func start() {
        showSignUpScreen()
    }
    
    func showSignUpScreen() {
        let signUpVC = factory.createSignUpScreen()
        signUpVC.onSignUpEmail = {
            self.showSignUpEmailScreen()
        }
        signUpVC.onLogIn = { [weak self] in
            self?.showLogInScreen()
        }
        presenter.setViewControllers([signUpVC], animated: true)
    }
    
    func showSignUpEmailScreen() {
        let signUpEmailVC = factory.createSignUpEmailScreen()
        signUpEmailVC.onShowConfirmEmail = { signUpModel in
            self.showConfirmEmailScreen(signUpModel)
        }
        presenter.pushViewController(signUpEmailVC, animated: true)
    }
    
    func showConfirmEmailScreen(_ signUpModel: SignUpModel?) {
        let confirmEmailVC = factory.createConfirmEmailScreen(signUpModel)
        presenter.pushViewController(confirmEmailVC, animated: true)
    }
    
    func showLogInScreen() {
        let loginVC = factory.createLogInScreen()
        loginVC.onShowHome = { [weak self] in
            self?.showHomeScreen()
        }
        loginVC.onForgot = {
            
        }
        presenter.pushViewController(loginVC, animated: true)
    }
    
    func showHomeScreen() {
        let vc = factory.createTabBarScreen()
        presenter.setViewControllers([vc], animated: false)
    }
}
