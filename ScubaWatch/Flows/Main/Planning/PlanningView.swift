//
//  PlanningView.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import Foundation

protocol PlanningView {
    var onShowPlanner: ((PlanningRow) -> Void)? { get set }
}
