//
//  TankVolumeTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import RESegmentedControl
import UIKit

class TankVolumeTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var segmentedControl: RESegmentedControl?
    
    var tankVolume: TankVolume = .L_10 {
        didSet {
            segmentedControl?.selectedSegmentIndex = tankVolume.rawValue
        }
    }
    
    var onSegmentChanged: ((TankVolume) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        titleLabel?.font = .boldPoppins()
        titleLabel?.textColor = .primaryGrey()
        titleLabel?.text = "tank_volume".localized

        var preset = defaultBootstapPreset()
        preset.configure()
        let segmentModels = TankVolume.allCases.map({SegmentModel(title: $0.title)})
        segmentedControl?.configure(segmentItems: segmentModels, preset: preset)
        segmentedControl?.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        segmentedControl?.layoutSubviews()
    }
    
    @objc func segmentValueChanged(_ sender: RESegmentedControl) {
        guard let tankVolume = TankVolume(rawValue: sender.selectedSegmentIndex) else { return }
        guard tankVolume != self.tankVolume else {
            return
        }
        onSegmentChanged?(tankVolume)
    }
}


// MARK: - TankVolumeTableViewCell Private
private extension BootstapPreset {
    
    mutating func configure() {
        self.selectedSegmentItemCornerRadius = 8
        self.textFont = .regularPoppins(size: 14)
        self.selectedTextFont = .regularPoppins(size: 14)
        self.segmentItemSeparator = SeparatorStyle(color: .primaryWhite() ?? .white, width: 0.5, offset: 8)
    }
}
