#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint tamper_checker.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'tamper_checker'
  s.version          = '0.0.1'
  s.summary          = '避免应用程序克隆。'
  s.description      = <<-DESC
  避免应用程序克隆。
                       DESC
  s.homepage         = 'http://xiaomeili.cn'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'info@xiaomeili.cn' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
