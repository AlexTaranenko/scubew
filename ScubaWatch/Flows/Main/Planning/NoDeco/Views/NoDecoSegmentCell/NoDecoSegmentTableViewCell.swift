//
//  NoDecoSegmentTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import RESegmentedControl
import UIKit

class NoDecoSegmentTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var segmentedControl: RESegmentedControl?
    
    var noDecoSegmentRow: NoDecoSegmentRow = .air {
        didSet {
            segmentedControl?.selectedSegmentIndex = noDecoSegmentRow.rawValue
        }
    }
    
    var onSegmentChanged: ((NoDecoSegmentRow) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        var preset = defaultBootstapPreset()
        preset.configure()
        segmentedControl?.configure(segmentItems: [
            SegmentModel(title: NoDecoSegmentRow.air.title), SegmentModel(title: NoDecoSegmentRow.nitrox.title)
        ], preset: preset)
        segmentedControl?.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        segmentedControl?.layoutSubviews()
    }
    
    @objc func segmentValueChanged(_ sender: RESegmentedControl) {
        guard let noDecoSegmentRow = NoDecoSegmentRow(rawValue: sender.selectedSegmentIndex) else { return }
        guard noDecoSegmentRow != self.noDecoSegmentRow else {
            return
        }
        onSegmentChanged?(noDecoSegmentRow)
    }
}

// MARK: - NoDecoSegmentTableViewCell Private
private extension BootstapPreset {
    
    mutating func configure() {
        self.selectedSegmentItemCornerRadius = 8
        self.textFont = .regularPoppins(size: 14)
        self.selectedTextFont = .regularPoppins(size: 14)
    }
}
