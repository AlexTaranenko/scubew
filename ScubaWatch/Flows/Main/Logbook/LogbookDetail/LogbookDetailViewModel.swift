//
//  LogbookDetailViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

class LogbookDetailViewModel {
    
    var logbookModel: LogbookModel
    var chartType: ChartType
    
    init(_ logbookModel: LogbookModel) {
        self.logbookModel = logbookModel
        self.chartType = .depth
    }
}
