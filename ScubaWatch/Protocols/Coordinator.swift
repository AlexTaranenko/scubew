//
//  Coordinator.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

protocol Coordinator {
    var presenter: UINavigationController { get set }
    
    func start()
}
