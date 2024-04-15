//
//  TabBarViewController.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let homeCoordinator = HomeCoordinator()
    let logbookCoordinator = LogbookCoordinator()
    let planningCoordinator = PlanningCoordinator()
    let settingsCoordinator = SettingsCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppereance()
        setupControllers()
        
        tabBar.addBorder(.top, color: .primaryDarkBle(), thickness: 0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupAppereance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .primaryBlack()
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor.primaryBlue() as Any
            ]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.primaryDarkBle() as Any
            ]
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.primaryDarkBle()
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.primaryBlue()
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.backgroundColor = .primaryBlack()
            tabBar.tintColor = .primaryBlue()
            tabBar.unselectedItemTintColor = .primaryDarkBle()
        }
    }
    
    private func setupControllers() {
        var viewControllers = [UIViewController]()
        
        homeCoordinator.start()
        viewControllers.append(homeCoordinator.presenter)
        
        logbookCoordinator.start()
        viewControllers.append(logbookCoordinator.presenter)
        
        planningCoordinator.start()
        viewControllers.append(planningCoordinator.presenter)
        
        settingsCoordinator.start()
        viewControllers.append(settingsCoordinator.presenter)
        
        self.viewControllers = viewControllers
        selectedIndex = TabBarItem.home.rawValue
    }
}

// MARK: - Private extension
private extension UITabBar {
    func addBorder(_ edge: UIRectEdge, color: UIColor?, thickness: CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        self.addSubview(subview)
        switch edge {
        case .top, .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .top {
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            } else {
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            }
        case .left, .right:
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .left {
                subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            } else {
                subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            }
        default:
            break
        }
    }
}
