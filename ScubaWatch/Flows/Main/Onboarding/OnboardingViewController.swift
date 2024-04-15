//
//  OnboardingViewController.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import DeviceKit
import UIKit

class OnboardingViewController: BaseViewController, StoryboardIdentifiable, OnboardingView {
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .onboarding
    
    // MARK: - IBOutlet
    @IBOutlet weak var stepView: StepView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet var titleArrowViews: [TitleArrowView]?
    @IBOutlet weak var nextButton: FillButton?
    
    // MARK: - OnboardingView
    var onShowAccount: (() -> Void)?
    var onShowSynchronize: ((OnboardingSensor) -> Void)?
    var onFinish: (() -> Void)?
    
    // MARK: - Override
    override func setupUI() {
        bgImage = Asset.Images.backgroundTwo.image
        
        setupTitleLabel()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stepView?.step = AppStorage.instance.step
        updateStateButtons()
        addColorToShadow(.primaryDarkBle())
    }
    
    // MARK: - Private
    private func setupTitleLabel() {
        let mutAttrString = NSMutableAttributedString(string: "onboarding_title".localized, attributes: [
            .font: UIFont.boldPoppins(size: Device.current.isPad ? 48 : 28),
            .foregroundColor: UIColor.primaryWhite() as Any
        ])
        mutAttrString.append(NSAttributedString(string: "\n"))
        mutAttrString.append(NSAttributedString(string: "Ocean.inc".localized, attributes: [
            .font: UIFont.boldPoppins(size: Device.current.isPad ? 48 : 28),
            .foregroundColor: UIColor.primaryBlack() as Any
        ]))
        
        titleLabel?.attributedText = mutAttrString
    }
    
    private func setupButtons() {
        OnboardingRow.allCases.forEach { onboardingRow in
            titleArrowViews?[onboardingRow.rawValue].text = onboardingRow.title
            titleArrowViews?[onboardingRow.rawValue].onClick = { [weak self] in
                switch onboardingRow {
                case .account:
                    self?.onShowAccount?()
                case .sync:
                    self?.onShowSynchronize?(.sync)
                default:
                    self?.onShowSynchronize?(.gps)
                }
            }
        }
        
        nextButton?.setTitle("next".localized, for: .normal)
        nextButton?.onTouchUpInSide = { [weak self] _ in
            self?.onFinish?()
        }
    }
    
    private func updateStateButtons() {
        nextButton?.alpha = AppStorage.instance.step == OnboardingRow.allCases.count ? 1 : 0
        
        OnboardingRow.allCases.forEach({
            titleArrowViews?[$0.rawValue].isUserInteractionEnabled = $0.rawValue <= AppStorage.instance.step
            if $0.rawValue <= AppStorage.instance.step - 1 {
                titleArrowViews?[$0.rawValue].inactiveState()
            } else {
                titleArrowViews?[$0.rawValue].activeState()
            }
            
            if AppStorage.instance.step >= OnboardingRow.allCases.count {
                titleArrowViews?[$0.rawValue].isUserInteractionEnabled = true
            }
        })
    }
}
