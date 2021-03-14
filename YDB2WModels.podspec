#
#  Be sure to run `pod spec lint YDB2WModels.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "YDB2WModels"
  spec.version      = "1.0.16"
  spec.summary      = "YDB2WModels."
  spec.homepage     = "http://yourdev/YDB2WModels"

  spec.license          = "MIT"
  spec.author       = { "Douglas Hennrich" => "douglashennrich@yourdev.com.br" }

  spec.swift_version    = "5.0"
  spec.platform         = :ios, "11.0"
  spec.source           = { :git => "https://github.com/Hennrich-Your-Dev/YDB2WModels.git", :tag => "#{spec.version}" }
  spec.source_files     = "YDB2WModels/**/*.{h,m,swift,xib,storyboard}"
    spec.resources        = [
    "YDB2WModels/**/*.{json}",
    "YDB2WModels/*.{json}"
  ]

  spec.dependency "YDExtensions"
  spec.dependency "YDUtilities"

end
