//
//  LogbookFactory.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

class LogbookFactory: Factory {
    
    func createLogbookScreen() -> LogbookViewController {
        return LogbookViewController.instantiate()
    }
    
    func createLogbookDetailScreen(_ model: LogbookModel) -> LogbookDetailViewController {
        let logbookDetailVC = LogbookDetailViewController.instantiate()
        logbookDetailVC.viewModel = LogbookDetailViewModel(model)
        return logbookDetailVC
    }
    
    func createTypeOfDiveScreen(_ selectedTypeOfDives: [TypeOfDive]) -> TypeOfDiveViewController {
        let vc = TypeOfDiveViewController.instantiate()
        vc.viewModel = TypeOfDiveViewModel(selectedTypeOfDives)
        return vc
    }
}
