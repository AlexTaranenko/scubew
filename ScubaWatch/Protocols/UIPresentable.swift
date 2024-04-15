//
//  UIPresentable.swift
//  messenger
//
//  Created by Alex on 06.04.2022.
//

import Foundation

protocol UIPresentable {
    
    func setupUI()
    func updateUI()
}

extension UIPresentable {
    func updateUI() {}
}
