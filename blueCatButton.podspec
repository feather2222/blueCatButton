Pod::Spec.new do |s|
  s.name         = "blueCatButton"
  s.version      = "0.1.1"
  s.summary      = "Lightweight GradientButton with countdown and click animation."
  s.description  = <<-DESC
A lightweight UI component providing a customizable GradientButton with gradient direction,
corner radius, highlight effect, click animation, and countdown support.
  DESC
  s.homepage     = "https://github.com/feather2222/blueCatButton"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "duojia" => "1402479908@qq.com" }
  s.source       = { :git => "https://github.com/feather2222/blueCatButton.git", :tag => s.version.to_s }
  s.platform     = :ios, "12.0"
  s.swift_version = "5.0"
  s.source_files = "blueCatButton/**/*.{swift}"
  s.frameworks   = "UIKit"
end
