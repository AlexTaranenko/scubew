//
//  ConfirmingOutput.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import Foundation

protocol ConfirmingOutput {
    var onShowTerms: ((ConfirmingRow) -> Void)? { get set }
    var onShowSignUp: (() -> Void)? { get set }
}
