//
//  SignUpOutput.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import Foundation

protocol SignUpOutput {
    
    var onSignUpEmail: (() -> Void)? { get set }
    var onLogIn: (() -> Void)? { get set }
}
