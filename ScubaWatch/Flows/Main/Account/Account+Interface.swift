//
//  Account+Interface.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

extension AccountViewController {
    
    func setupLabels() {
        titleLabel?.text = "edit_account".localized
        titleLabel?.font = .boldPoppins(size: 28)
        
        emailLabel?.text = "account_email".localized
        nameLabel?.text = "your_name".localized
        phoneLabel?.text = "emergency_number".localized
    }
    
    func setupEnterFields() {
        emailTextField?.placeholder = "email".localized
        emailTextField?.text = viewModel?.user?.email
        phoneTextField?.textField?.keyboardType = .emailAddress
        emailTextField?.onValueChange = { [weak self] text in
            self?.viewModel?.user?.email = text
            self?.updateStateButton()
        }
        
        nameTextField?.placeholder = "name".localized
        nameTextField?.text = viewModel?.user?.name
        nameTextField?.onValueChange = { [weak self] text in
            self?.viewModel?.user?.name = text
            self?.updateStateButton()
        }
        
        phoneTextField?.placeholder = "phone".localized
        phoneTextField?.text = viewModel?.user?.phoneNumber
        phoneTextField?.textField?.keyboardType = .phonePad
        phoneTextField?.onValueChange = { [weak self] text in
            self?.viewModel?.user?.phoneNumber = text
            self?.updateStateButton()
        }
    }
    
    func setupButtons() {
        settingButton?.setImage(Asset.Images.settingsIcon.image.withTintColor(.primaryWhite() ?? .white), for: .normal)
        
        saveButton?.setTitle(viewModel?.isEditAccount == true ? "save".localized : "next".localized, for: .normal)
        
        settingButton?.onTouchUpInSide = { [weak self] _ in
            self?.showPhotoAlert(handler: { photoPicker in
                switch photoPicker {
                case .take:
                    self?.imagePicker.cameraAsscessRequest()
                case .gallery:
                    self?.imagePicker.photoGalleryAsscessRequest()
                }
            })
        }
        saveButton?.onTouchUpInSide = { [weak self] _ in
            if AppStorage.instance.step == OnboardingRow.account.rawValue {
                AppStorage.instance.step += 1
            }
            
            self?.navigationController?.popViewController(animated: true)
        }
        
        updateStateButton()
    }
    
    private func updateStateButton() {
        let isActive = viewModel?.isActiveButton ?? false
        if isActive {
            saveButton?.activeButton()
        } else {
            saveButton?.inactiveButton()
        }
    }
}
