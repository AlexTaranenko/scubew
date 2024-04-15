//
//  LoginView.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

protocol LoginView {
    var onShowHome: (() -> Void)? { get set }
    var onForgot: (() -> Void)? { get set }
}
