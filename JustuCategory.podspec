
Pod::Spec.new do |s|
  s.name         = "JustuCategory"
  s.version      = "0.0.2"
  s.summary      = "A short description of JustuCategory."
  s.description  = <<-DESC
  						this project provide all kinds of categories for iOS developer
                   DESC

  s.homepage     = "https://github.com/engebei/JustuCategory"
  
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author       = { "engebei" => "718149076@qq.com" }
  s.platform     = :ios
  s.ios.deployment_target = '7.0'
  s.source       = { :git => "https://github.com/engebei/JustuCategory.git", :tag => "0.0.2" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true
end
