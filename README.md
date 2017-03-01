# ScreenshotSharer
ScreenshotSharer is a little Swift 3.0 pod that enables users to share a spesific part of view or whole screen when they took a screenshot. It's heavly inspired from Asos app and highly customizable. 

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
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //register a view and set sender as presenter
        sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
            
            //this block is called when the user took a screenshot
            //image is the image of given view. It may be cropped according to given cropRect.
            //sharerViewController is the presented view controller
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //If you want to enable ScreenshotSharer in spesific views only, you shouldn't forget to unregister it when view is disappeared.
        sssharer.unregister()
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
    func setScreenshotImage(image:UIImage)

    func setShareTitle(title:String)
    func setShareDescription(description:String)
    func setShareButtonTitle(title:String)
    
    func setShareTitleFont(font:UIFont)
    func setShareDescriptionFont(font:UIFont)
    func setShareButtonTitleFont(font:UIFont)
```
#### Designing Your Own Sharer View Controller
In some cases you may want to design whole sharer view controller from stratch. To do this your sharer view controller should extend ScreenshotSharerViewController class and you should register it to ScreenshotSharer instance.
```swift
let customSharerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomScreenShotSharerViewController") as! CustomScreenShotSharerViewController
        
sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sharerViewController: customSharerVC, sender: self) { (image, sharerViewController) in
            
}
```
You can copy the ScreenshotSharerMinimal.swift and ScreenshotSharerMinimal.xib files as your base design.

License
----
MIT

**Free Software, Hell Yeah!**