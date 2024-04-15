//
//  LocationViewController.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class LocationViewController: BaseViewController, StoryboardIdentifiable, LocationView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .location
    
    // MARK: - LocationView
    var onShowLocationDetail: ((LocationModel) -> Void)?
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: BaseTableView?
    @IBOutlet weak var searchTextField: UITextField?
    
    let viewModel = LocationViewModel()
    
    // MARK: - Ovveride
    override func setupUI() {
        
        navigationItem.title = "location_planner".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTextField()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        removeBottomBorder()
        addColorToShadow(.primaryBlack())
    }
    
    // MARK: - Private
    private func setupTextField() {
        searchTextField?.cornerRadius = 10
        searchTextField?.borderWidth = 1
        searchTextField?.borderColor = .primaryWhite()
        searchTextField?.textColor = .primaryWhite()
        searchTextField?.font = .regularPoppins()
        searchTextField?.attributedPlaceholder = NSAttributedString(string: "search".localized, attributes: [
            .font: UIFont.regularPoppins(),
            .foregroundColor: UIColor.primaryWhite() as Any
        ])
        let searchIcon = Asset.Images.searchIcon.image.withTintColor(.primaryWhite() ?? .white)
        searchTextField?.addPaddingAndIcon(searchIcon, padding: 16)
        searchTextField?.addTarget(self, action: #selector(searchEditingChanged(_:)), for: .editingChanged)
    }
    
    private func setupTableView() {
        tableView?.sectionHeaderTopPadding = 0
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.registerCell(type: LocationTableViewCell.self)
    }
    
    // MARK: - Actions
    @objc func searchEditingChanged(_ sender: UITextField) {
        viewModel.searchText = sender.text
        tableView?.reloadData()
    }
}
