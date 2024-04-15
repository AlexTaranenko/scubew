//
//  LoadingInterface.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import Foundation

protocol LoadingOutput {
    
    var onLoadingOutput: ((LoadingScreen) -> Void)? { get set }
}

protocol LoadingInterface {
    
    func getLoadingData()
}
