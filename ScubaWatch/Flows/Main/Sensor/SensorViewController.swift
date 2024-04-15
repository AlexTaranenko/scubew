//
//  SensorViewController.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import DeviceKit
import UIKit

class SensorViewController: BaseViewController, StoryboardIdentifiable, SensorView {
    
    @IBOutlet weak var navTitleLabel: BoldLabel?
    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var descriptionLabel: RegularLabel?
    @IBOutlet weak var nextButton: FillButton?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .sensor
    
    // MARK: - SensorView
    var onShowNextSensor: ((OnboardingSensor) -> Void)?
    var onFinish: (() -> Void)?
    
    var viewModel: SensorViewModel?
    
    // MARK: - Override
    override func setupUI() {
        setupLabels()
        setupButton()
        
        if viewModel?.onboardingSensor == .sync {            
            showHUD()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if AppStorage.instance.step == OnboardingRow.sync.rawValue {
                    AppStorage.instance.step += 1
                }
                self.dismissHUD()
                self.onFinish?()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addColorToShadow(.primaryBlack())
    }
    
    // MARK: - Private
    private func setupLabels() {
        navTitleLabel?.font = .boldPoppins(size: Device.current.isPad ? 48 : 28)
        if viewModel?.onboardingSensor == .sync {
            navTitleLabel?.text = "sync_with_apple_watch".localized
        } else {
            navTitleLabel?.text = "sensor_authorisation".localized
        }
        
        titleLabel?.textColor = .primaryBlue()
        titleLabel?.font = .boldPoppins(size: Device.current.isPad ? 40 : 24)
        titleLabel?.text = viewModel?.onboardingSensor.values.0
        descriptionLabel?.font = .regularPoppins(size: Device.current.isPad ? 28 : 17)
        descriptionLabel?.text = viewModel?.onboardingSensor.values.1
    }
    
    private func setupButton() {
        nextButton?.backgroundColor = .primaryTransparentBlue()
        nextButton?.setTitle("next".localized, for: .normal)
        nextButton?.onTouchUpInSide = { [weak self] _ in
            if self?.viewModel?.onboardingSensor == .gps {
                self?.onShowNextSensor?(.health)
            } else {
                if AppStorage.instance.step == OnboardingRow.sensor.rawValue {
                    AppStorage.instance.step += 1
                }
                self?.navigationController?.popToViewController(ofClass: OnboardingViewController.self)
            }
        }
        
        nextButton?.isHidden = viewModel?.onboardingSensor == .sync
    }
}
