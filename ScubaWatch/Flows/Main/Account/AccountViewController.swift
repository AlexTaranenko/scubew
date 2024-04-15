//
//  AccountViewController.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

class AccountViewController: BaseViewController, StoryboardIdentifiable {
    
    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var emailLabel: BoldLabel?
    @IBOutlet weak var nameLabel: BoldLabel?
    @IBOutlet weak var phoneLabel: BoldLabel?
    @IBOutlet weak var photoImageView: UIImageView?
    @IBOutlet weak var settingButton: UIButton?
    @IBOutlet weak var saveButton: FillButton?
    @IBOutlet weak var emailTextField: BaseTextFieldView?
    @IBOutlet weak var nameTextField: BaseTextFieldView?
    @IBOutlet weak var phoneTextField: BaseTextFieldView?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .account
    
    override var isNavigationBarVisible: Bool { true }
    
    var viewModel: AccountViewModel?
    
    lazy var imagePicker: ImagePicker = {
        let imagePicker = ImagePicker()
        imagePicker.delegate = self
        return imagePicker
    }()
    
    // MARK: - Override
    override func setupUI() {
        setupLabels()
        setupEnterFields()
        setupButtons()
        
        #if DEBUG
        viewModel?.user?.name = "Test name"
        viewModel?.user?.email = "Testemail@gmail.com"
        viewModel?.user?.phoneNumber = "+3800000000"
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addColorToShadow(.primaryBlack())
    }
}

extension AccountViewController: ImagePickerDelegate {
    
    func imagePicker(_ imagePicker: ImagePicker, grantedAccess: Bool, to sourceType: UIImagePickerController.SourceType) {
        guard grantedAccess else { return }
        imagePicker.present(parent: self, sourceType: sourceType)
    }
    
    func imagePicker(_ imagePicker: ImagePicker, didSelect image: UIImage) {
        imagePicker.dismiss()
    }
    
    func cancelButtonDidClick(on imageView: ImagePicker) {
        imagePicker.dismiss()
    }
}
