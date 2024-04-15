//
//  LogbookViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class LogbookViewController: BaseViewController, StoryboardIdentifiable, LogbookView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .logbook
    
    override var isTabBarVisible: Bool { true }
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: BaseTableView?
    
    // MARK: - LogbookView
    var onSHowLogbookDetail: ((LogbookModel) -> Void)?
    
    // MARK: - Properties
    let viewModel = LogbookViewModel()
    
    // MARK: - Override
    override func setupUI() {
        setupNavigationBarItems()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        removeBottomBorder()
        addColorToShadow(.primaryDarkBle())
    }
    
    // MARK: - Private
    private func setupNavigationBarItems() {
        setupBarItem(title: "logbook".localized,
                     image: Asset.Images.logbookIcon.image.withTintColor(.primaryWhite() ?? .white))
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.registerCell(type: LogbookTableViewCell.self)
    }
}
