platform :ios, '11.0'
inhibit_all_warnings!

def di_pods
  pod 'Swinject', '~> 2.1.1'
  pod 'SwinjectAutoregistration', '~> 2.1.1'
end

def helper_pods
  pod 'PromiseKit', '~> 4.5.0'
  pod 'SwiftLint', '~> 0.27'
end

def test_pods
  pod 'Nimble-Snapshots', :git => 'https://github.com/ashfurrow/Nimble-Snapshots.git', :branch => 'master'
  pod 'Nimble', '~> 7.3.1'
  pod 'Quick', '~> 1.3.2'
end

def ui_pods
  pod 'IHKeyboardAvoiding', '~> 4.1'
  pod 'Pastel', '~> 0.4'
  pod 'Reveal-SDK', :configurations => ['Debug']
  pod 'SnapKit', '~> 4.0.0'
end

target 'CCNumberValidator' do
  use_frameworks!
  di_pods
  helper_pods
  ui_pods

  target 'CCNumberValidatorTests' do
    inherit! :search_paths
    test_pods
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        case target.name
            when 'IHKeyboardAvoiding', 'PromiseKit', 'SnapKit', 'Pastel'
            swift_version = '4.0'
            else
            swift_version = '4.2'
        end
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = swift_version
        end
    end
end
