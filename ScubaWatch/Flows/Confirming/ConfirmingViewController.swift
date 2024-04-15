//
//  ConfirmingViewController.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

class ConfirmingViewController: BaseViewController, StoryboardIdentifiable, ConfirmingOutput {
    
    // MARK: - ConfirmingOutput
    var onShowTerms: ((ConfirmingRow) -> Void)?
    var onShowSignUp: (() -> Void)?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .confirming
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: BaseTableView?
    @IBOutlet weak var nextButton: FillButton?
    @IBOutlet weak var checkingView: CheckingView?
    
    var viewModel: ConfirmingViewModel?
    
    // MARK: - Init
    override func setupUI() {
        bgImage = Asset.Images.backgroundTwo.image
        setupNextButton()
        setupTableView()
        setupCheckingView()
        updateStateButton()
    }    
}
