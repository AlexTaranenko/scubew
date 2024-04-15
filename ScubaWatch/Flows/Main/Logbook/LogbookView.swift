//
//  LogbookView.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

protocol LogbookView {
    var onSHowLogbookDetail: ((LogbookModel) -> Void)? { get set }
}
