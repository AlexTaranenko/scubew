//
//  ConfirmEmailViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class ConfirmEmailViewController: BaseViewController, StoryboardIdentifiable {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .confirmEmail
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var descriptionLabel: RegularLabel?
    @IBOutlet weak var sendLabel: UILabel?
    
    // MARK: - Properties
    var viewModel: ConfirmEmailViewModel?
    
    // MARK: - Override
    override func setupUI() {
        bgImage = Asset.Images.backgroundTwo.image
        
        // TODO: Test
        AppStorage.instance.isLoggedIn = true
        
        setupLabels()
    }
    
    // MARK: - Private
    private func setupLabels() {
        titleLabel?.font = .boldPoppins(size: 28)
        titleLabel?.text = "sign_up".localized.lowercased().capitalized
        
        descriptionLabel?.text = "confirm_email_desc".localized([
            viewModel?.signUpModel?.name ?? "",
            viewModel?.signUpModel?.email ?? ""
        ])
        
        let text = "\("havent_received".localized)\n\("send_again".localized)"
        let mutAttrString = NSMutableAttributedString(string: text, attributes: [
            .font: UIFont.regularPoppins(),
            .foregroundColor: UIColor.primaryWhite() as Any
        ])
        let range = mutAttrString.mutableString.range(of: "send_again".localized)
        mutAttrString.addAttribute(.foregroundColor, value: UIColor.primaryBlue() as Any, range: range)
        sendLabel?.attributedText = mutAttrString
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(sendDidTap(_:)))
        sendLabel?.isUserInteractionEnabled = true
        sendLabel?.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    @objc func sendDidTap(_ gesture: UIGestureRecognizer) {
        
    }
}
