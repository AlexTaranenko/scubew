# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

install! 'cocoapods', :warn_for_unused_master_specs_repo => false

# ignore all warnings from all pods
inhibit_all_warnings!

target 'ScubaWatch' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'SwiftLint'
pod 'SwiftGen', '~> 6.0'
pod 'DeviceKit', '~> 4.0'
pod 'KRProgressHUD'
pod 'RESegmentedControl'
pod 'DGCharts'
#pod 'IQKeyboardManagerSwift'
#pod 'SwiftLocation/Core'
#pod 'Moya', '~> 14.0'

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
end

end
