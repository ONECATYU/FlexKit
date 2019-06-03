
Pod::Spec.new do |s|
  s.name         = "FlexKit"
  s.version      = "1.0.1"
  s.summary      = "1.支持虚拟div,避免导致视图增多问题。2.支持scrollView contentSize。3.支持CALayer布局，UIView和CALayer混合布局。4.根据node树，UIView/CALayer自动添加到父视图。"
  s.homepage     = "https://github.com/ONECATYU/FlexKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "ONECATYU" => "786910875@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ONECATYU/FlexKit.git", :tag => s.version.to_s }
  s.source_files  = "FlexKit", "FlexKit/**/*.{h,m,swift}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
  s.dependency 'Yoga', '~> 1.14.0'
  s.swift_version = '5.0'
  
end
