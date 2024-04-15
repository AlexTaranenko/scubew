//
//  NoDecoViewController.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class NoDecoViewController: BaseViewController, StoryboardIdentifiable {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .noDeco
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: BaseTableView?
    
    // MARK: - Properties
    private(set) var viewModel = NoDecoViewModel()
    
    private lazy var noDecoFooterView: NoDecoFooterView = {
        let noDecoFooterView = NoDecoFooterView()
        noDecoFooterView.setupUI()
        noDecoFooterView.frame.size.height = NoDecoFooterView.height
        return noDecoFooterView
    }()
    
    // MARK: - Override
    override func setupUI() {
        
        navigationItem.title = "no_deco_planner".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        removeBottomBorder()
        addColorToShadow(.primaryBlack())
    }
    
    // MARK: - Private
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.tableFooterView = noDecoFooterView
        
        tableView?.registerCell(type: DatePickerTableViewCell.self)
        tableView?.registerCell(type: NoDecoSegmentTableViewCell.self)
        tableView?.registerCell(type: NitroxTableViewCell.self)
        tableView?.registerCell(type: DepthTableViewCell.self)
    }
}
