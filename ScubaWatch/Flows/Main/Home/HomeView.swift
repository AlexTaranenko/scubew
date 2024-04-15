//
//  HomeOutput.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

protocol HomeView {
    
    var onShowAccount: (() -> Void)? { get set }
    var onShowOnboarding: (() -> Void)? { get set }
}
