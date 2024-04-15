//
//  SignUpViewController.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class SignUpViewController: BaseViewController, StoryboardIdentifiable, SignUpOutput {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var subTitleLabel: RegularLabel?
    @IBOutlet weak var applButton: FillButton?
    @IBOutlet weak var lineView: LineView?
    @IBOutlet weak var emailButton: BorderButton?
    @IBOutlet weak var loginButton: BorderButton?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .signUp
    
    // MARK: - SignUpOutput
    var onSignUpEmail: (() -> Void)?
    var onLogIn: (() -> Void)?
    
    // MARK: - Init
    override func setupUI() {
        bgImage = Asset.Images.backgroundOne.image
        
        lineView?.thinDivider()
        
        setupLabels()
        setupButtons()
    }
    
    // MARK: - Private
    private func setupLabels() {
        titleLabel?.font = .boldPoppins(size: 48)
        titleLabel?.text = "hi".localized
        
        subTitleLabel?.font = .regularPoppins()
        subTitleLabel?.text = "signup_login".localized
    }
    
    private func setupButtons() {
        applButton?.backgroundColor = .primaryWhite()
        applButton?.tintColor = .primaryBlack()
        applButton?.setTitle("signup_apple".localized, for: .normal)
        applButton?.setImage(Asset.Images.appleIcon.image, for: .normal)
        
        emailButton?.setTitle("signup_email".localized, for: .normal)
        loginButton?.setTitle("log_in".localized, for: .normal)
        
        applButton?.onTouchUpInSide = { [weak self] _ in
            
        }
        emailButton?.onTouchUpInSide = { [weak self] _ in
            self?.onSignUpEmail?()
        }
        loginButton?.onTouchUpInSide = { [weak self] _ in
            self?.onLogIn?()
        }
    }
}
