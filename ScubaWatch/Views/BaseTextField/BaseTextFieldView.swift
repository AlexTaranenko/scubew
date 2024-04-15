//
//  BaseTextFieldView.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class BaseTextFieldView: NibLoadableView, UIPresentable {
    
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var lineView: LineView?
    
    var placeholder: String = "" {
        didSet {
            updateUI()
        }
    }
    
    var text: String? = nil {
        didSet {
            updateUI()
        }
    }
    
    var onValueChange: ((String?) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        lineView?.thinDivider()
        
        text = nil
        textField?.textColor = .white
        textField?.font = .regularPoppins()
        textField?.addTarget(self, action: #selector(textFieldEditing(_:)), for: .editingChanged)
    }
    
    func updateUI() {
        textField?.text = text
        textField?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .font: UIFont.regularPoppins(),
            .foregroundColor: UIColor.primaryWhite() as Any
        ])
    }
    
    @objc func textFieldEditing(_ sender: UITextField) {
        onValueChange?(sender.text)
    }
}
