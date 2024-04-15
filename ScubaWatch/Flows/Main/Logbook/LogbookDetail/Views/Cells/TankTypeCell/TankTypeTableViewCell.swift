//
//  TankTypeTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import RESegmentedControl
import UIKit

class TankTypeTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var segmentedControl: RESegmentedControl?
    
    var tankType: TankType = .steel {
        didSet {
            segmentedControl?.selectedSegmentIndex = tankType.rawValue
        }
    }
    
    var onSegmentChanged: ((TankType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        
        clearBG()
        
        titleLabel?.font = .boldPoppins()
        titleLabel?.textColor = .primaryGrey()
        titleLabel?.text = "tank_type".localized
        
        var preset = defaultBootstapPreset()
        preset.configure()
        let segmentModels = TankType.allCases.map({SegmentModel(title: $0.title)})
        segmentedControl?.configure(segmentItems: segmentModels, preset: preset)
        segmentedControl?.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        segmentedControl?.layoutSubviews()
    }
    
    @objc func segmentValueChanged(_ sender: RESegmentedControl) {
        guard let tankType = TankType(rawValue: sender.selectedSegmentIndex) else { return }
        guard tankType != self.tankType else {
            return
        }
        onSegmentChanged?(tankType)
    }
}

// MARK: - TankTypeTableViewCell Private
private extension BootstapPreset {
    
    mutating func configure() {
        self.selectedSegmentItemCornerRadius = 8
        self.textFont = .regularPoppins(size: 14)
        self.selectedTextFont = .regularPoppins(size: 14)
    }
}
