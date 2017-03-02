Pod::Spec.new do |s|
  s.name             = 'ScreenshotSharer'
  s.version          = '0.1.7'
  s.summary          = 'ScreenshotSharer is a little Swift 3.0 pod that enables users to share screenshot image quickly.'
 
  s.description      = <<-DESC
ScreenshotSharer is a little Swift 3.0 pod that enables users to share a spesific part of view or whole screen when they took a screenshot. It's heavly inspired from Asos app and highly customizable.
                       DESC
 
  s.homepage         = 'https://github.com/yagiz/ScreenshotSharer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yagiz' => 'yagizgurgul@gmail.com' }
  s.source           = { :git => 'https://github.com/yagiz/ScreenshotSharer.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'ScreenshotSharer/Source/**/*.{swift,xib,png}'
 
end