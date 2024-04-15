//
//  UIAlertController+DatePicker.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import DeviceKit
import UIKit

extension UIAlertController {
    
    func addDatePicker(mode: UIDatePicker.Mode, date: Date?, minimumDate: Date? = nil, action: DatePickerView.Action?) {
        let datePicker = DatePickerView(mode: mode, date: date, minimumDate: minimumDate, action: action)
        set(vc: datePicker, height: datePicker.view.frame.height)
    }
    
    func set(vc: UIViewController?, height: CGFloat? = nil) {
        guard let vc = vc else { return }
        setValue(vc, forKey: "contentViewController")
        if let height = height {
            vc.preferredContentSize.height = height
            preferredContentSize.height = height
        }
    }
    
    func setupPopoverPresentationController(sourceView: UIView? = nil) {
        if Device.current.isPad {
            popoverPresentationController?.sourceView = sourceView ?? self.view
            popoverPresentationController?.sourceRect = sourceView?.bounds ?? self.view.bounds
        }
    }
}
