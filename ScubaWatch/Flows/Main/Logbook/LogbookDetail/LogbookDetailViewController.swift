//
//  LogbookDetailViewController.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class LogbookDetailViewController: BaseViewController, StoryboardIdentifiable, LogbookDetailView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .logbookDetail
    
    // MARK: - LogbookDetailView
    var onShowTypeOfDive: (([TypeOfDive]) -> Void)?
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: - Properties
    var viewModel: LogbookDetailViewModel?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Override
    override func setupUI() {
        navigationItem.title = viewModel?.logbookModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTypeOfDives), name: .typeOfDive, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        removeBottomBorder()
        addColorToShadow(.primaryBlack())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let nav = self.navigationController {
            let isPopping = !nav.viewControllers.contains(self)
            if isPopping {
                NotificationCenter.default.removeObserver(self)
            }
        }
    }
    
    // MARK: - Private
    private func setupTableView() {
        tableView?.sectionHeaderTopPadding = 0
        tableView?.backgroundColor = .clear
        tableView?.separatorStyle = .none
        tableView?.dataSource = self
        tableView?.delegate = self
        
        let deleteFooterView = DeleteFooterView()
        deleteFooterView.setupUI()
        deleteFooterView.frame.size.height = DeleteFooterView.height
        deleteFooterView.onDelete = { [weak self] in
            self?.showDeleteAlert(message: "delete_message".localized(["Demo"]))
        }
        tableView?.tableFooterView = deleteFooterView
        
        tableView?.registerCell(type: DateLogbookTableViewCell.self)
        tableView?.registerCell(type: MapLogbookTableViewCell.self)
        tableView?.registerCell(type: NameLogbookTableViewCell.self)
        tableView?.registerCell(type: SegmentChartTableViewCell.self)
        tableView?.registerCell(type: SettingsLogbookTableViewCell.self)
        tableView?.registerCell(type: DiveResultTableViewCell.self)
        tableView?.registerCell(type: TankTypeTableViewCell.self)
        tableView?.registerCell(type: TankVolumeTableViewCell.self)
        tableView?.registerCell(type: VisibilityTableViewCell.self)
        tableView?.registerCell(type: SurfaceConditionTableViewCell.self)
        tableView?.registerCell(type: CurrentTableViewCell.self)
        tableView?.registerCell(type: LocationTableViewCell.self)
        tableView?.registerCell(type: NotesTableViewCell.self)
        tableView?.registerCell(type: BuddiesTableViewCell.self)
        tableView?.registerCell(type: GearsTableViewCell.self)
        tableView?.registerCell(type: WeightTableViewCell.self)
        tableView?.registerCell(type: ChartTableViewCell.self)
    }
    
    // MARK: - Actions
    @objc func updateTypeOfDives(_ notification: Notification) {
        if let typeOfDives = notification.object as? [TypeOfDive] {
            viewModel?.logbookModel.typeOfDive = typeOfDives
            guard let section = LogbookDetailSection.allCases.firstIndex(where: {$0 == .typeOfDive}) else { return }
            tableView?.reloadSections(IndexSet(integer: section), with: .automatic)
        }
    }
}
