//
//  LocationView.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

protocol LocationView {
    var onShowLocationDetail: ((LocationModel) -> Void)? { get set }
}
