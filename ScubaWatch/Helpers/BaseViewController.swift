//
//  BaseViewController.swift
//  messenger
//
//  Created by Alex on 06.04.2022.
//

import UIKit

class BaseViewController: UIViewController, UIPresentable {

    open var isNavigationBarVisible: Bool {
        return true
    }
        
    override var shouldAutorotate: Bool {
        return false
    }
    
    open var isTabBarVisible: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    open var bgImage: UIImage? = nil {
        didSet {
            updateUI()
        }
    }

    private let imageView: UIImageView = {
        let imgView = UIImageView(frame: UIScreen.main.bounds)
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .primaryBlack()
        overrideUserInterfaceStyle = .light
        extendedLayoutIncludesOpaqueBars = true
        navigationController?.isNavigationBarHidden = !isNavigationBarVisible
        navigationController?.navigationBar.prefersLargeTitles = false
        
        configureNavigationBar()
        setupUI()
        
        view.insertSubview(imageView, at: 0)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationBar()
        updateTabBar()
        updateUI()
        
        setNeedsStatusBarAppearanceUpdate()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Open Funcs
    
    open func setupUI() {}
    
    open func updateUI() {
        imageView.image = bgImage
    }
    
    open func updateTabBar() {
        setTabBarVisible(visible: isTabBarVisible, animated: true)
    }
    
    open func updateNavigationBar() {}
        
    open func configureNavigationBar(bgColor: UIColor? = .clear,
                                     titleFont: UIFont = .regularPoppins(),
                                     largeFont: UIFont = .semiBoldPoppins()) {
        let appearance = NavigationBarAppearance(backgroundColor: bgColor,
                                                 titleFont: titleFont,
                                                 largeFont: largeFont).appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = false
    }
}

extension UIViewController {
    func setTabBarVisible(visible: Bool, animated: Bool) {
        guard let tb = tabBarController as? TabBarViewController else { return }
        tb.tabBar.isHidden = !visible
    }
}
