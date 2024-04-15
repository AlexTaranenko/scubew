//
//  ViewController.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

class LoadingViewController: BaseViewController, StoryboardIdentifiable, LoadingOutput {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: BoldLabel?
    
    // MARK: - Properties
    var viewModel: LoadingViewModel?
    
    // MARK: - LoadingOutput
    var onLoadingOutput: ((LoadingScreen) -> Void)?
    
    // MARK: - StoryboardIdentifiable
    static var storyboard: Storyboard = .loading
    
    // MARK: - Init
    override func setupUI() {
        bgImage = Asset.Images.backgroundOne.image
        titleLabel?.font = .boldPoppins(size: 48)
        
        viewModel?.onLoadingOutput = onLoadingOutput
        viewModel?.getLoadingData()
    }
}
