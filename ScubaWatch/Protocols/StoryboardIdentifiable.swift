//
//  StoryboardIdentifiable.swift
//  Telepromter
//
//  Created by Alex on 14.04.2023.
//

import Foundation
import UIKit

protocol StoryboardIdentifiable {
    static var storyboard: Storyboard { get }
    
    static func instantiate() -> Self
}

extension StoryboardIdentifiable where Self: UIViewController {
    
    static func instantiate() -> Self {
        guard let storyboardIdentifiable = UIStoryboard(storyboard).instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self else {
            fatalError("Not instantiate: \(String(describing: Self.self))")
        }
        return storyboardIdentifiable
    }
}
