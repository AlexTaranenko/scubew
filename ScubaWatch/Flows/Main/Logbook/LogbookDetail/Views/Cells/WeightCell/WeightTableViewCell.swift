//
//  WeightTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import UIKit

class WeightTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var lineView: LineView?
    @IBOutlet weak var pickerView: PickerView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        titleLabel?.text = "weight".localized
        titleLabel?.textColor = .primaryGrey()
        lineView?.thinDivider()
        
        pickerView?.itemsType = .weight
        pickerView?.onSelectItem = { result in
            switch result {
            case .weight(let weight):
                debugPrint(weight)
            default:
                break
            }
        }
    }
}
