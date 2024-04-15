//
//  Fonts+Extension.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

extension UIFont {
    static func boldPoppins(size: CGFloat = 17) -> UIFont {
        return FontFamily.Poppins.bold.font(size: size)
    }
    
    static func semiBoldPoppins(size: CGFloat = 28) -> UIFont {
        return FontFamily.Poppins.semiBold.font(size: size)
    }
    
    static func regularPoppins(size: CGFloat = 17) -> UIFont {
        return FontFamily.Poppins.regular.font(size: size)
    }
}
