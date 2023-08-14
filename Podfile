# Uncomment the next line to define a global platform for your project
# platform :ios, '10.0'

target 'PracticeSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PracticeSwift

  pod 'Socket.IO-Client-Swift'

  pod 'Alamofire', '5.1'

  pod 'SnapKit'

  pod 'YPImagePicker'

  pod 'IQKeyboardManagerSwift'

end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end