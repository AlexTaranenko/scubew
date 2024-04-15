//
//  SettingsViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class SettingsViewController: BaseViewController, StoryboardIdentifiable, SettingsView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .settings
    
    // MARK: - IBOutlet
    @IBOutlet var titleArrowViews: [TitleArrowView]?
    @IBOutlet weak var logoutButton: BorderButton!
    
    // MARK: - SettingsView
    var onShowScreen: ((SettingsArrow) -> Void)?
    var onLogout: (() -> Void)?
    
    // MARK: - Override
    override var isTabBarVisible: Bool { true }
    
    override func setupUI() {
        setupNavigationBarItems()
        setupTitleArrows()
        setupLogoutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addColorToShadow(.primaryDarkBle())
    }

    // MARK: - Private
    private func setupNavigationBarItems() {
        setupBarItem(title: "settings".localized,
                     image: Asset.Images.settingsIcon.image.withTintColor(.primaryWhite() ?? .white))
    }
    
    private func setupTitleArrows() {
        SettingsArrow.allCases.forEach { settingsArrow in
            titleArrowViews?[settingsArrow.rawValue].text = settingsArrow.title
            titleArrowViews?[settingsArrow.rawValue].onClick = { [weak self] in
                self?.onShowScreen?(settingsArrow)
            }
        }
    }
    
    private func setupLogoutButton() {
        logoutButton.setTitle("logout".localized, for: .normal)
        logoutButton.onTouchUpInSide = { [weak self] _ in
            self?.showAlert(message: "logout_text".localized, firstActionTitle: "yes".localized, firstHandler: { _ in
                self?.onLogout?()
            }, secondActionTitle: "no".localized)
        }
    }
}
