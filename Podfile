platform :ios, '9.0'
inhibit_all_warnings!

def di_pods
  pod 'Swinject', '~> 2.1.1'
  pod 'SwinjectAutoregistration', '~> 2.1.1'
end

def helper_pods
  pod 'PromiseKit', '~> 4.0'
  pod 'SwiftLint', '~> 0.22'
end

def test_pods
  pod 'Nimble-Snapshots', '~> 6.3.0'
  pod 'Nimble', '~> 7.0'
  pod 'Quick', '~> 1.2'
end

def ui_pods
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
