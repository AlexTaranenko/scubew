//
//  DepthTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class DepthTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var pickerView: PickerView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        pickerView?.itemsType = .depth
        pickerView?.onSelectItem = { result in
            switch result {
            case .depth(let item):
                debugPrint(item)
            default:
                break
            }
        }
    }
}
