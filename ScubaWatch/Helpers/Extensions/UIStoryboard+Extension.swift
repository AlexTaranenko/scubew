//
//  UIStoryboard+Extension.swift
//  messenger
//
//  Created by Alex on 06.04.2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    convenience init(_ storyboard: Storyboard) {
        self.init(name: storyboard.rawValue, bundle: nil)
    }
}
