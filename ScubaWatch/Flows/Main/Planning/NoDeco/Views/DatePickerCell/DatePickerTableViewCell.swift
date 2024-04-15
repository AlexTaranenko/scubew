//
//  DatePickerTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var datePicker: UIDatePicker?

    var onSecondsChanged: ((TimeInterval) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        datePicker?.setValue(UIColor.white, forKey: "textColor")
        datePicker?.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)
    }
    
    @objc func timeChanged(_ sender: UIDatePicker) {
        onSecondsChanged?(sender.countDownDuration)
    }
}
