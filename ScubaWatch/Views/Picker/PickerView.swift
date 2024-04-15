//
//  CustomPickerView.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class PickerView: NibLoadableView, UIPresentable {
    
    enum PickerItemsType {
        case ppo, oxygen, depth, weight
        
        var symbol: String? {
            switch self {
            case .oxygen: return "%"
            case .depth: return "m".localized
            case .weight: return "kg".localized
            default: return nil
            }
        }
    }
    
    enum PickerResult {
        case ppo(Double)
        case oxygen(Int)
        case depth(Int)
        case weight(Double)
    }
    
    @IBOutlet weak var symbolLabel: RegularLabel?
    @IBOutlet weak var pickerView: UIPickerView?
    
    private let ppoArray = Array(stride(from: 1.00, to: 1.41, by: 0.01))
    private let oxygenArray = Array(22...40)
    private let depthArray = Array(0...33)
    private let weightArray = Array(stride(from: 0, to: 50.5, by: 0.5))
    
    var itemsType: PickerItemsType = .ppo {
        didSet {
            pickerView?.reloadAllComponents()
            symbolLabel?.isHidden = itemsType == .ppo
            symbolLabel?.text = itemsType.symbol
        }
    }
    
    var onSelectItem: ((PickerResult) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        pickerView?.backgroundColor = .clear
        pickerView?.dataSource = self
        pickerView?.delegate = self
    }
}

extension PickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch itemsType {
        case .ppo: return ppoArray.count
        case .oxygen: return oxygenArray.count
        case .depth: return depthArray.count
        case .weight: return weightArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        switch itemsType {
        case .ppo:
            return attributedTitle(String(format: "%.2f", ppoArray[row]))
        case .oxygen:
            return attributedTitle("\(oxygenArray[row])")
        case .depth:
            return attributedTitle("\(depthArray[row])")
        case .weight:
            return attributedTitle(String(format: "%.1f", weightArray[row]))
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch itemsType {
        case .ppo:
            onSelectItem?(.ppo(ppoArray[row]))
        case .oxygen:
            onSelectItem?(.oxygen(oxygenArray[row]))
        case .depth:
            onSelectItem?(.depth(depthArray[row]))
        case .weight:
            onSelectItem?(.weight(weightArray[row]))
        }
    }
    
    private func attributedTitle(_ title: String) -> NSAttributedString? {
        return NSAttributedString(string: title, attributes: [
            .foregroundColor: UIColor.white as Any
        ])
    }
}
