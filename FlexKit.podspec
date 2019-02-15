
Pod::Spec.new do |s|
  s.name         = "FlexKit"
  s.version      = "0.0.6"
  s.summary      = "FlexLayout,支持链式调用,虚拟div"
  s.description  = <<-DESC
                    *链式调用
                    *虚拟div
                    *基于YogaKit
                   DESC
  s.homepage     = "https://github.com/ONECATYU/FlexKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "ONECATYU" => "786910875@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ONECATYU/FlexKit.git", :tag => s.version.to_s }
  s.source_files  = "FlexKit", "FlexKit/**/*.{h,m}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
  s.dependency "YogaKit"
  
end
