//
//  SegmentChartTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import RESegmentedControl
import UIKit

class SegmentChartTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var segmentedControl: RESegmentedControl?
    
    var chartType: ChartType = .depth {
        didSet {
            segmentedControl?.selectedSegmentIndex = chartType.rawValue
            segmentedControl?.layoutSubviews()
        }
    }
    
    var onSegmentChanged: ((ChartType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        var preset = defaultBootstapPreset()
        preset.configure()
        let segmentModels = ChartType.allCases.map({SegmentModel(title: $0.title)})
        segmentedControl?.configure(segmentItems: segmentModels, preset: preset)
        segmentedControl?.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        segmentedControl?.layoutSubviews()
    }
    
    @objc func segmentValueChanged(_ sender: RESegmentedControl) {
        guard let chartType = ChartType(rawValue: sender.selectedSegmentIndex) else { return }
        guard chartType != self.chartType else {
            return
        }
        onSegmentChanged?(chartType)
    }
}

// MARK: - SegmentChartTableViewCell Private
private extension BootstapPreset {
    
    mutating func configure() {
        self.selectedSegmentItemCornerRadius = 8
        self.textFont = .regularPoppins(size: 14)
        self.selectedTextFont = .regularPoppins(size: 14)
        self.segmentItemSeparator = SeparatorStyle(color: .primaryWhite() ?? .white, width: 0.5, offset: 8)
    }
}
