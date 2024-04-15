//
//  SettingsLogbookTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class SettingsLogbookTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet var containersView: [UIView]?
    @IBOutlet weak var timeView: DiveSettingsView?
    @IBOutlet weak var tempView: DiveSettingsView?
    @IBOutlet weak var ascentView: DiveSettingsView?
    @IBOutlet weak var depthView: DiveSettingsView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        containersView?.forEach({
            $0.borderWidth = 0.5
            $0.cornerRadius = 16
        })
        
        timeView?.titleLabel?.text = "dive_time".localized
        tempView?.titleLabel?.text = "min_temp".localized
        ascentView?.titleLabel?.text = "max_ascent_rate".localized
        depthView?.titleLabel?.text = "max_depth".localized
    }
    
    func populateSettingsLogbookCell() {
        timeView?.resultLabel?.text = "57:15"
        tempView?.resultLabel?.text = "\(3)°С"
        ascentView?.resultLabel?.text = "\(16)m/min"
        depthView?.resultLabel?.text = "\(31)m"
    }
}
