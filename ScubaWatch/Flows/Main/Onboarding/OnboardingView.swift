//
//  OnboardingView.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import Foundation

protocol OnboardingView {
    var onShowAccount: (() -> Void)? { get set }
    var onShowSynchronize: ((OnboardingSensor) -> Void)? { get set }
    var onFinish: (() -> Void)? { get set }
}
