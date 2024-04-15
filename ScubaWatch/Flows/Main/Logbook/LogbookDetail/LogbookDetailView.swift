//
//  LogbookDetailView.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import Foundation

protocol LogbookDetailView {
    var onShowTypeOfDive: (([TypeOfDive]) -> Void)? { get set }
}
