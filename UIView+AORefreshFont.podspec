Pod::Spec.new do |s|
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.name         = "UIView+AORefreshFont"
  s.version      = "1.0.3"
  s.summary      = "UIView+AORefreshFont is a category on UIView that provides a convenience method for resetting the dynamic type font of a text-input view."

  s.homepage     = "https://github.com/JRG-Developer/UIView-AORefreshFont.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Joshua Greene" => "jrg.developer@gmail.com" }
  s.source   	   = { :git => "https://github.com/JRG-Developer/UIView-AORefreshFont.git", :tag => "#{s.version}"}
  s.framework    = "UIKit"
  s.requires_arc = true
  s.source_files = "UIView+AORefreshFont/*.{h,m}"
end
