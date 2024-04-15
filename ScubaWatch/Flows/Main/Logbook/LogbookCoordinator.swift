//
//  LogbookCoordinator.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class LogbookCoordinator: Coordinator {
    var presenter: UINavigationController = UINavigationController()
    let factory: LogbookFactory
    
    init() {
        self.factory = LogbookFactory()
    }
    
    func start() {
        showLogbookScreen()
        presenter.tabBarItem = UITabBarItem(title: TabBarItem.logbook.title,
                                            image: TabBarItem.logbook.icon,
                                            tag: TabBarItem.logbook.rawValue)
    }
    
    private func showLogbookScreen() {
        let vc = factory.createLogbookScreen()
        vc.onSHowLogbookDetail = { [weak self] model in
            self?.showLogbookDetailScreen(model)
        }
        presenter.setViewControllers([vc], animated: false)
    }
    
    private func showLogbookDetailScreen(_ model: LogbookModel) {
        let vc = factory.createLogbookDetailScreen(model)
        vc.onShowTypeOfDive = { [weak self] selectedTypes in
            self?.showTypeOfDiveScreen(selectedTypes)
        }
        presenter.pushViewController(vc, animated: true)
    }
    
    private func showTypeOfDiveScreen(_ selectedTypes: [TypeOfDive]) {
        let vc = factory.createTypeOfDiveScreen(selectedTypes)
        presenter.pushViewController(vc, animated: true)
    }
}
