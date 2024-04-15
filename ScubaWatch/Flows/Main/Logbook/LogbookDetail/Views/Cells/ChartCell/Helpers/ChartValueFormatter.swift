//
//  DateValueFormatter.swift
//  ScubaWatch
//
//  Created by Alex on 14.07.2023.
//

import DGCharts
import Foundation

public class DateValueFormatter: NSObject, AxisValueFormatter {
    private let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "HH:mm\n●"
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}

public class NumberValueFormatter: NSObject, AxisValueFormatter {
    
    public func stringForValue(_ value: Double, axis: DGCharts.AxisBase?) -> String {
        return "\(value) -"
    }
}
