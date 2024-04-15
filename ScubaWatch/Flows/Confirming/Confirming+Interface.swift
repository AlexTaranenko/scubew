//
//  Confirming+Interface.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

extension ConfirmingViewController {
    
    func setupTableView() {
        tableView?.registerCell(type: ConfirmingTableViewCell.self)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func setupNextButton() {
        nextButton?.setTitle("next".localized, for: .normal)
        nextButton?.onTouchUpInSide = { [weak self] _ in
            do {
                try self?.viewModel?.checkPermissions()
                AppStorage.instance.confirmedBirthday = true
                self?.onShowSignUp?()
            } catch let error {
                self?.showErrorAlert(message: (error as? ConfirmingViewModel.ConfirmingError)?.description)
            }
        }
    }
    
    func updateStateButton() {
        let isSelectCheckmark = viewModel?.isSelectCheckmark ?? false
        if isSelectCheckmark {
            nextButton?.activeButton()
        } else {
            nextButton?.inactiveButton()
        }
    }
    
    func setupCheckingView() {
        checkingView?.isSelectCheckmark = viewModel?.isSelectCheckmark ?? false
        checkingView?.onSelectCheckmark = { [weak self] selected in
            self?.viewModel?.isSelectCheckmark = selected
            self?.checkingView?.isSelectCheckmark = self?.viewModel?.isSelectCheckmark ?? false
            self?.updateStateButton()
        }
    }
}
