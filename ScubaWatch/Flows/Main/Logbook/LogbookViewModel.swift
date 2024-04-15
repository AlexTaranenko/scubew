//
//  LogbookViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

class LogbookViewModel {
    
    private(set) var logbooks: [LogbookModel]
    
    init() {
        self.logbooks = [
            LogbookModel(title: "Demo", street: "Shark Fin Rock, Lanai’i (Hawaii)", date: "13 June 2023, 12:51")
        ]
    }
}
