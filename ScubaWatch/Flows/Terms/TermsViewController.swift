//
//  TermsViewController.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class TermsViewController: BaseViewController, StoryboardIdentifiable {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .terms
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: BaseTableView?
    
    // MARK: - Properties
    var confirmingRow: ConfirmingRow?
    
    // MARK: - Init
    override func setupUI() {
        bgImage = Asset.Images.backgroundTwo.image
        setupTableView()
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerCell(type: TermsTableViewCell.self)
    }
}
