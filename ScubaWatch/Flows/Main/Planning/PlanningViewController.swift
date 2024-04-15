//
//  PlanningViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class PlanningViewController: BaseViewController, StoryboardIdentifiable, PlanningView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .planning
    
    // MARK: - IBOutlet
    @IBOutlet var titleArrowViews: [TitleArrowView]?
    
    // MARK: - PlanningView
    var onShowPlanner: ((PlanningRow) -> Void)?
    
    // MARK: - Override
    override var isTabBarVisible: Bool { true }
    
    override func setupUI() {
        setupNavigationBarItems()
        setupTitleArrows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        removeBottomBorder()
        addColorToShadow(.primaryDarkBle())
    }
    
    // MARK: - Private
    private func setupNavigationBarItems() {
        setupBarItem(title: "planning".localized,
                     image: Asset.Images.planningIcon.image.withTintColor(.primaryWhite() ?? .white))
    }
    
    private func setupTitleArrows() {
        PlanningRow.allCases.forEach { planningRow in
            titleArrowViews?[planningRow.rawValue].text = planningRow.title
            titleArrowViews?[planningRow.rawValue].onClick = { [weak self] in
                self?.onShowPlanner?(planningRow)
            }
        }
    }
}
