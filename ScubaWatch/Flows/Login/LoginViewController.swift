//
//  LoginViewController.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

class LoginViewController: BaseViewController, StoryboardIdentifiable, LoginView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .login
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: SemiBoldLabel?
    @IBOutlet weak var emailTextField: BaseTextFieldView?
    @IBOutlet weak var passwordTextField: BaseTextFieldView?
    @IBOutlet weak var forgetButton: UIButton?
    @IBOutlet weak var nextButton: FillButton?
    
    // MARK: - LoginView
    var onShowHome: (() -> Void)?
    var onForgot: (() -> Void)?
    
    private let viewModel = LoginViewModel()
    
    // MARK: - Override
    override func setupUI() {
        bgImage = Asset.Images.backgroundTwo.image
                
        titleLabel?.text = "log_in".localized
        setupTextFields()
        setupButtons()
    }
    
    // MARK: - Private
    private func setupTextFields() {
        emailTextField?.placeholder = "email".localized
        emailTextField?.textField?.keyboardType = .emailAddress
        passwordTextField?.placeholder = "password".localized
        passwordTextField?.textField?.isSecureTextEntry = true
        
        emailTextField?.onValueChange = { [weak self] text in
            self?.viewModel.email = text
            self?.updateStateButton()
        }
        passwordTextField?.onValueChange = { [weak self] text in
            self?.viewModel.password = text
            self?.updateStateButton()
        }
    }
    
    private func setupButtons() {
        nextButton?.setTitle("next".localized, for: .normal)
        nextButton?.onTouchUpInSide = { [weak self] _ in
            do {
                try self?.viewModel.checkValidFields()
                AppStorage.instance.isLoggedIn = true
                self?.onShowHome?()
            } catch let error {
                if let signUpError = (error as? SignUpEmailViewModel.SignUpError) {
                    self?.showErrorAlert(message: signUpError.description)
                } else {
                    self?.showErrorAlert(message: error.localizedDescription)
                }
            }
        }
        
        setupForgetButton()
        updateStateButton()
    }
    
    private func setupForgetButton() {
        forgetButton?.setTitle("forget_password".localized, for: .normal)
        forgetButton?.setTitleColor(.primaryBlue(), for: .normal)
        forgetButton?.titleLabel?.font = .regularPoppins()
        forgetButton?.onTouchUpInSide = { [weak self] _ in
            self?.onForgot?()
        }
    }
    
    private func updateStateButton() {
        let isActive = viewModel.isActiveButton
        if isActive {
            nextButton?.activeButton()
        } else {
            nextButton?.inactiveButton()
        }
    }
}
