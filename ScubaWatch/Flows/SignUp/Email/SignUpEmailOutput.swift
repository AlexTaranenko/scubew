//
//  SignUpEmailOutput.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import Foundation

protocol SignUpEmailOutput {
    var onShowConfirmEmail: ((SignUpModel?) -> Void)? { get set }
}
