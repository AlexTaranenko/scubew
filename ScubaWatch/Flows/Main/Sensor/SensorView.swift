//
//  SensorView.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import Foundation

protocol SensorView {
    
    var onShowNextSensor: ((OnboardingSensor) -> Void)? { get set }
    var onFinish: (() -> Void)? { get set }
}
