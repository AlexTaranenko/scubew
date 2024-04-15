//
//  HomeViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class HomeViewController: BaseViewController, StoryboardIdentifiable, HomeView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .home
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: BaseTableView?
    
    // MARK: - HomeView
    var onShowAccount: (() -> Void)?
    var onShowOnboarding: (() -> Void)?
    
    // MARK: - Override
    override var isNavigationBarVisible: Bool { true }
    override var isTabBarVisible: Bool { true }
    
    override func setupUI() {
        setupNavigationBarItems()
        setupTableView()
    }
            
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addColorToShadow(.primaryDarkBle())
        
        tableView?.reloadData()
    }
    
    // MARK: - Private
    private func setupNavigationBarItems() {
        setupBarItem(title: "Ocean.inc", image: Asset.Images.logo.image, iconWidth: 70, fontSize: 15)
        setupBarItem(image: Asset.Images.settingsIcon.image.withTintColor(.primaryWhite() ?? .white),
                     isRight: true) { [weak self] in
            self?.onShowAccount?()
        }
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerCell(type: WelcomeTableViewCell.self)
    }
}
