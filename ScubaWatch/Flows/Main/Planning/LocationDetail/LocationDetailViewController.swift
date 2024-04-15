//
//  LocationDetailViewController.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class LocationDetailViewController: BaseViewController, StoryboardIdentifiable {
    
    // MARK: - StoryboardIdentifiable
    @IBOutlet weak var tableView: BaseTableView?
    @IBOutlet weak var shareButton: BorderButton?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .locationDetail
    
    // MARK: - Propeerties
    
    var model: LocationModel?
    
    // MARK: - Override
    override func setupUI() {
    
        navigationItem.title = model?.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupShareButton()
        setupTableView()
    }
    
    // MARK: - Private
    private func setupShareButton() {
        shareButton?.setTitle("share_this_location".localized, for: .normal)
        shareButton?.leftImage = Asset.Images.shareIcon.image.withTintColor(.primaryWhite() ?? .white)
        shareButton?.onTouchUpInSide = { _ in
            
        }
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.registerCell(type: LocationDetailTableViewCell.self)
    }
}
