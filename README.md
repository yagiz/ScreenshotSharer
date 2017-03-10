# ScreenshotSharer
ScreenshotSharer is a little Swift 3.0 pod that enables users to share a specific part of the view or the whole screen when they took a screenshot. It's heavily inspired from Asos app and highly customizable. 

### Preview
![](https://github.com/yagiz/ScreenshotSharer/blob/master/screenshots/preview.gif?raw=true)

### Installation

#### CocoaPods
```sh
pod 'ScreenshotSharer'
```
#### Manually
Just download or clone the repo and move Classes folder to your project.

### Usage
You can init a new ScreeshotSharer instance to register a view or window to be captured. 

#### Capturing a View
```swift
import UIKit
import ScreenshotSharer

class ViewController: UIViewController {
    
    let sssharer = ScreenshotSharer()
    
    @IBOutlet weak var captureView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sssharer.registerViewCapturer(view: self.captureView, cropRect: CGRect.zero) { (image, screenshotSharerViewController) in
        
            //this block is called when the user takes a screenshot
            //image is the image of given view and it can be cropped according to cropRect.
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
sssharer.registerScreenCapturer(cropStatusBar: true, cropRect: CGRect.zero) { (image, screenshotSharerViewController) in

    //this block is called when the user takes a screenshot
    //image is the image of given view and it can be cropped according to cropRect.
    //sharerViewController is the presented view controller
    
}
```

#### Customizing Default Sharer View Controller 
By default ScreenshotSharer uses ScreenshotSharerMinimal as the presented sharer view controller. You can customize it in the captureBlock:
```swift
sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
    if let sharerViewController = sharerViewController
    {
        sharerViewController.view.backgroundColor = UIColor.red
        sharerViewController.setShareTitleText(_ text: String)
        sharerViewController.setShareTitleFont(_ font: UIFont)
        sharerViewController.setShareTitleColor(_ color: UIColor)
    }
}
```
These are the all the methods you can use to customize default sharer view controller:
```swift
    func setShareTitleText(_ text:String)
    func setShareDescriptionText(_ text:String)
    func setShareButtonTitleText(_ text:String)

    func setShareTitleFont(_ font:UIFont)
    func setShareDescriptionFont(_ font:UIFont)
    func setShareButtonTitleFont(_ font:UIFont)
    
    func setShareTitleTextColor(_ color:UIColor)
    func setShareDescriptionTextColor(_ color:UIColor)
    func setShareButtonTitleColor(_ color:UIColor)
    func setShareButtonBackgroundColor(_ color:UIColor)
```
#### Designing Your Own Sharer View Controller
In some cases you may want to design the whole sharer view controller from stratch. To do this your sharer view controller should extend ScreenshotSharerViewController class and you should register it to ScreenshotSharer instance. Default sharer view controller uses UIActivityViewController but you can implement your own share logic.
```swift
let customSharer = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomSharerViewController") as! CustomSharerViewController
        
sssharer.registerScreenCapturer(cropStatusBar: true, cropRect: CGRect.zero, sharerViewController: customSharer) { (image, customScreenshotSharerViewController) in
            
}
```
You can use the ScreenshotSharerMinimal.swift and ScreenshotSharerMinimal.xib files as your base design. ScreenshotSharer will present your own view controller and call this method:
```swift
func setScreenshotImage(_ image:UIImage)
```
When you want to dismiss the sharer view controller you should call this method in your own sharer view controller:
```swift
self.screenshotSharer().dismissSharerViewController()
```


License
----
MIT

**Free Software, Hell Yeah!**