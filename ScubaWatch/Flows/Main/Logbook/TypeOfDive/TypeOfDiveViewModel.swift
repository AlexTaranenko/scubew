//
//  TypeOfDiveViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import Foundation

class TypeOfDiveViewModel {
    
    var selectedTypeOfDive: [TypeOfDive]
    
    init(_ selectedTypeOfDive: [TypeOfDive]) {
        self.selectedTypeOfDive = selectedTypeOfDive
    }
}
