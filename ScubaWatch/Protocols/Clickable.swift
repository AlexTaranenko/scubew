//
//  Clickable.swift
//  salaam eats
//
//  Created by Aleksey Robul on 05.10.2020.
//

import Foundation

protocol Clickable {
    var onClick: (() -> Void)? { get set }
}
