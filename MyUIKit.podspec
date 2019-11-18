#
# Be sure to run `pod lib lint MyUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MyUIKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MyUIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SeraphinD/bbl-swift-lille-uikit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Séraphin' => 'seraphin.desumeur@outlook.fr' }
  s.source           = { :git => 'https://github.com/SeraphinD/bbl-swift-lille-uikit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'MyUIKit/Classes/**/*'
  
  s.ios.script_phase = {
      :name => 'Design Token Script',
      :script => 'if [ -d "../../${PRODUCT_NAME}/Classes" ]; then'+"\n"+'cd ..'+"\n"+'python3 Scripts/design_token.py -p "../${PRODUCT_NAME}/Classes/design.swift" "1"'+"\n"+'fi',
      :execution_position => :before_compile
  }
  
  # s.resource_bundles = {
  #   'MyUIKit' => ['MyUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
