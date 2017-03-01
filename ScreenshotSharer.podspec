Pod::Spec.new do |s|
  s.name             = 'ScreenshotSharer'
  s.version          = '0.1.2'
  s.summary          = 'SSSharer is a little Swift 3.0 pod that enables users to share screenshot image quickly.'
 
  s.description      = <<-DESC
SSSharer is a little Swift 3.0 pod that enables users to share screenshot image quickly. It's inspired from Asos app. It's highly customizable. You can even design your own ViewController(XIB,Storyboard or pure by code) and use it as a sharer view.
                       DESC
 
  s.homepage         = 'https://github.com/yagiz/ScreenshotSharer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yagiz' => 'yagizgurgul@gmail.com' }
  s.source           = { :git => 'https://github.com/yagiz/ScreenshotSharer.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'ScreenshotSharer/Classes/**/*.{swift,xib,png}'
 
end