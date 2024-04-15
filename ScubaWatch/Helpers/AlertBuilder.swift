//
//  AlertBuilder.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class AlertBuilder {
    
    // MARK: - Properties
    private let title: String?
    private let message: String?
    
    private var actions = [UIAlertAction]()
    
    // MARK: - Init
    init(title: String? = nil, message: String? = nil) {
        self.title = title
        self.message = message
    }
    
    // MARK: - Public
    func action(title: String? = "ok".localized,
                style: UIAlertAction.Style = .default,
                handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        actions.append(UIAlertAction(title: title, style: style, handler: handler))
        return self
    }
    
    func build(preferredStyle: UIAlertController.Style = .alert) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for action in actions {
            alert.addAction(action)
        }
        return alert
    }
}
