//
//  TypeOfDiveViewController.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import UIKit

class TypeOfDiveViewController: BaseViewController, StoryboardIdentifiable {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .typeOfDive
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: BaseTableView?
    
    // MARK: - Properties
    var viewModel: TypeOfDiveViewModel?
    
    // MARK: - Override
    override func setupUI() {
        
        navigationItem.title = "type_of_dive".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        removeBottomBorder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.post(name: .typeOfDive, object: viewModel?.selectedTypeOfDive)
    }
    
    // MARK: - Private
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.registerCell(type: TypeOfDiveTableViewCell.self)
    }
}
