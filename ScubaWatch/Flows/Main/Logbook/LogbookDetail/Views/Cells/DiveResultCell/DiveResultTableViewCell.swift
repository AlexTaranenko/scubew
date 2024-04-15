//
//  DiveResultTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class DiveResultTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var modeResultView: DiveResultView?
    @IBOutlet weak var ppoResultView: DiveResultView?
    @IBOutlet weak var gasResultView: DiveResultView?
    @IBOutlet weak var altitudeResultView: DiveResultView?
    @IBOutlet weak var factorsResultView: DiveResultView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        [modeResultView, ppoResultView, gasResultView, altitudeResultView, factorsResultView].forEach({
            $0?.resultLabel?.text = nil
        })
    }
    
    func setupUI() {
        clearBG()
        
        modeResultView?.titleLabel?.text = "mode".localized
        ppoResultView?.titleLabel?.text = "ppo2".localized
        gasResultView?.titleLabel?.text = "gas".localized
        altitudeResultView?.titleLabel?.text = "dive_altitude".localized
        factorsResultView?.titleLabel?.text = "gradient_factors".localized
    }
    
    func populateDiveResultCell() {
        modeResultView?.resultLabel?.text = "Scuba"
        ppoResultView?.resultLabel?.text = "Scuba"
        gasResultView?.resultLabel?.text = "Air"
        altitudeResultView?.resultLabel?.text = "\(0) \("m".localized)"
        factorsResultView?.resultLabel?.text = "0 (70/85)"
    }
}
