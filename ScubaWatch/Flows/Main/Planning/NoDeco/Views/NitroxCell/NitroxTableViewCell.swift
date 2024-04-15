//
//  NitroxTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class NitroxTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var ppoLabel: UILabel?
    @IBOutlet weak var oxygenLabel: UILabel?
    @IBOutlet weak var ppoPickerView: PickerView?
    @IBOutlet weak var oxygenPickerView: PickerView?
    @IBOutlet weak var lineView: LineView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        let mutAttrString = NSMutableAttributedString(string: "ppo2_dive".localized, attributes: [
            .foregroundColor: UIColor.primaryGrey() as Any,
            .font: UIFont.boldPoppins()
        ])
        
        let range = mutAttrString.mutableString.range(of: "2")
        mutAttrString.addAttribute(.font, value: UIFont.boldPoppins(size: 12), range: range)
        ppoLabel?.attributedText = mutAttrString
        
        oxygenLabel?.text = "oxygen".localized
        oxygenLabel?.textColor = .primaryGrey()
        oxygenLabel?.font = .boldPoppins()
        
        ppoPickerView?.itemsType = .ppo
        oxygenPickerView?.itemsType = .oxygen
        
        lineView?.thinDivider()
        
        ppoPickerView?.onSelectItem = { [weak self] result in
            self?.pickerResult(result)
        }
        oxygenPickerView?.onSelectItem = { [weak self] result in
            self?.pickerResult(result)
        }
    }
    
    private func pickerResult(_ result: PickerView.PickerResult) {
        switch result {
        case .ppo(let ppo):
            debugPrint(ppo)
        case .oxygen(let oxygen):
            debugPrint(oxygen)
        default:
            break
        }
    }
}
