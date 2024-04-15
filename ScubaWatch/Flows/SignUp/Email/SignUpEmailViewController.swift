//
//  SignUpEmailViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class SignUpEmailViewController: BaseViewController, StoryboardIdentifiable, SignUpEmailOutput {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: SemiBoldLabel?
    
    @IBOutlet weak var nameTextField: BaseTextFieldView?
    @IBOutlet weak var emailTextField: BaseTextFieldView?
    @IBOutlet weak var passwordTextField: BaseTextFieldView?
    @IBOutlet weak var nextButton: FillButton?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .signUpEmail
    
    var viewModel: SignUpEmailViewModel?
    var onShowConfirmEmail: ((SignUpModel?) -> Void)?
    
    // MARK: - Override
    override func setupUI() {
        bgImage = Asset.Images.backgroundTwo.image
                
        titleLabel?.text = "sign_up".localized
        setupTextFields()
        setupNextButton()
    }
    
    // MARK: - Private
    private func setupTextFields() {
        nameTextField?.placeholder = "name".localized
        emailTextField?.placeholder = "email".localized
        emailTextField?.textField?.keyboardType = .emailAddress
        passwordTextField?.placeholder = "password".localized
        passwordTextField?.textField?.isSecureTextEntry = true
        
        nameTextField?.onValueChange = { [weak self] text in
            self?.viewModel?.signUpModel?.name = text
            self?.updateStateButton()
        }
        emailTextField?.onValueChange = { [weak self] text in
            self?.viewModel?.signUpModel?.email = text
            self?.updateStateButton()
        }
        passwordTextField?.onValueChange = { [weak self] text in
            self?.viewModel?.signUpModel?.password = text
            self?.updateStateButton()
        }
    }
    
    private func setupNextButton() {
        nextButton?.setTitle("next".localized, for: .normal)
        nextButton?.onTouchUpInSide = { [weak self] _ in
            do {
                try self?.viewModel?.checkValidFields()
                self?.onShowConfirmEmail?(self?.viewModel?.signUpModel)
            } catch let error {
                if let signUpError = (error as? SignUpEmailViewModel.SignUpError) {
                    self?.showErrorAlert(message: signUpError.description)
                } else {
                    self?.showErrorAlert(message: error.localizedDescription)
                }
            }
        }
        updateStateButton()
    }
    
    private func updateStateButton() {
        let isActive = viewModel?.isActiveButton ?? false
        if isActive {
            nextButton?.activeButton()
        } else {
            nextButton?.inactiveButton()
        }
    }
}
