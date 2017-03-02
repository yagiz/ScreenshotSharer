# ScreenshotSharer
ScreenshotSharer is a little Swift 3.0 pod that enables users to share a spesific part of view or whole screen when they took a screenshot. It's heavly inspired from Asos app and highly customizable. 

### Preview
![](https://github.com/yagiz/ScreenshotSharer/blob/master/preview.gif?raw=true)

### Installation

#### CocoaPods
```sh
pod 'ScreenshotSharer'
```
#### Manually
Just download or clone the repo and move Source folder to your project.

### Usage
You can init a new ScreeshotSharer instance to register a view or window to be captured. 

#### Capturing a View
```swift
import UIKit
import ScreenshotSharer

class ViewController: UIViewController {

    let sssharer = ScreenshotSharer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
            
            //this block is called when the user took a screenshot
            //image is image of given view and it may be cropped according to cropRect.
            //sharerViewController is the presented view controller
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        sssharer.isEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        sssharer.isEnabled = false
    }
}
```

#### Capturing Whole Screen
```swift
sssharer.registerScreenCapturer(cropStatusBar: true, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
    //this block is called when the user took a screenshot
    //image is the image of given view. It may be cropped according to given cropRect.
    //sharerViewController is the presented view controller
    
}
```

#### Customizing Default Sharer View Controller 
By default ScreenshotSharer uses ScreenshotSharerMinimal as presented sharer view controller. You can customize it in the captureBlock:
```swift
sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
    if let sharerViewController = sharerViewController
    {
        sharerViewController.view.backgroundColor = UIColor.red
        sharerViewController.setShareTitle(title: String)
        sharerViewController.setShareTitleFont(font: UIFont)
        sharerViewController.setShareTitleColor(color: UIColor)
    }
}
```
These are the whole methods you can use to customize default sharer view controller.
```swift
    func setShareTitle(title:String)
    func setShareDescription(description:String)
    func setShareButtonTitle(title:String)
    
    func setShareTitleFont(font:UIFont)
    func setShareDescriptionFont(font:UIFont)
    func setShareButtonTitleFont(font:UIFont)
    
    func setShareTitleTextColor(color:UIColor)
    func setShareDescriptionTextColor(color:UIColor)
    func setShareButtonTitleColor(color:UIColor)
    func setShareButtonBackgroundColor(color:UIColor)
```
#### Designing Your Own Sharer View Controller
In some cases you may want to design whole sharer view controller from stratch. To do this your sharer view controller should extend ScreenshotSharerViewController class and you should register it to ScreenshotSharer instance. Default sharer view controller uses UIActivityViewController but you can write your own share logic.
```swift
let customSharerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomScreenShotSharerViewController") as! CustomScreenShotSharerViewController
        
sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sharerViewController: customSharerVC, sender: self) { (image, sharerViewController) in
            
}
```
You can copy the ScreenshotSharerMinimal.swift and ScreenshotSharerMinimal.xib files as your base design. ScreenshotSharer will present your own view controller and call this method:
```swift
func setScreenshotImage(image:UIImage)
```
When you want to dismiss the sharer view controller you should call this method in your own sharer view controller:
```swift
self.screenshotSharer.dismissSharerViewController()
```


License
----
MIT

**Free Software, Hell Yeah!**