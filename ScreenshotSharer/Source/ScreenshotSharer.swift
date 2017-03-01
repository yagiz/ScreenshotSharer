//
//  ScreenshotCapturer.swift
//  ScreenshotCapturer
//
//  Created by Yagiz Gurgul on 27/02/2017.
//  Copyright © 2017 Yagiz Gurgul. All rights reserved.
//

import UIKit

open class ScreenshotSharer: NSObject
{
    open var sharerViewController:ScreenshotSharerViewController?
    open weak var sender:UIViewController?
    
    open weak var capturedView:UIView?
    open var isCropStatusBar:Bool = false
    open var cropRect:CGRect!
    
    open var captureBlock:((UIImage?,ScreenshotSharerViewController?) -> ())!
    open var isEnabled:Bool = true
    
    override public init()
    {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationUserDidTakeScreenshot(notification:)), name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
    }
    
    open func registerViewCapturer(view:UIView, cropRect:CGRect, sender:UIViewController?, captureBlock:@escaping ((UIImage?,ScreenshotSharerViewController?) -> ()))
    {
        self.registerViewCapturer(view: view, cropRect: cropRect, sharerViewController: ScreenshotSharerMinimal(nibName: "ScreenshotSharerMinimal", bundle: Bundle(for: ScreenshotSharerMinimal.self)), sender: sender, captureBlock: captureBlock)
    }
    
    open func registerScreenCapturer(cropStatusBar:Bool, cropRect:CGRect, sender:UIViewController?, captureBlock:@escaping ((UIImage?,ScreenshotSharerViewController?) -> ()))
    {
        self.registerScreenCapturer(cropStatusBar: cropStatusBar, cropRect: cropRect, sharerViewController: ScreenshotSharerMinimal(nibName: "ScreenshotSharerMinimal", bundle: Bundle(for: ScreenshotSharerMinimal.self)), sender: sender, captureBlock: captureBlock)
    }
    
    open func registerViewCapturer(view:UIView, cropRect:CGRect, sharerViewController:ScreenshotSharerViewController?, sender:UIViewController?, captureBlock:@escaping ((UIImage?,ScreenshotSharerViewController?) -> ()))
    {
        self.capturedView = view
        self.cropRect = cropRect
        self.sharerViewController = sharerViewController
        self.sender = sender
        self.captureBlock = captureBlock
    }
    
    open func registerScreenCapturer(cropStatusBar:Bool, cropRect:CGRect, sharerViewController:ScreenshotSharerViewController?, sender:UIViewController?, captureBlock:@escaping ((UIImage?,ScreenshotSharerViewController?) -> ()))
    {
        self.isCropStatusBar = cropStatusBar
        self.cropRect = cropRect
        self.sharerViewController = sharerViewController
        self.sender = sender
        self.captureBlock = captureBlock
        
        self.capturedView = nil
    }
    
    open func unregister()
    {
        self.cropRect = nil
        self.sharerViewController = nil
        self.sender = nil
        self.captureBlock = nil
        self.capturedView = nil
    }
    
    
    func applicationUserDidTakeScreenshot(notification:NSNotification)
    {
        
        if self.isEnabled == false
        {
            return
        }
        
        if let view = capturedView, let sender = self.sender, let sharerViewController = sharerViewController
        {
            self.isEnabled = false
            
            let image = self.takeImageOf(view: view)
            let croppedImage = self.crop(image: image, rect: self.cropRect)
            
            sender.present(sharerViewController, animated: false, completion: nil)
            sharerViewController.screenshotSharer = self
            sharerViewController.setScreenshotImage(image: croppedImage)
            
            self.captureBlock(croppedImage,sharerViewController)
            
            return
            
        }else if let window = UIApplication.shared.windows.first, let sender = self.sender, let sharerViewController = sharerViewController
        {
            self.isEnabled = false
            
            let image = self.takeImageOf(view: window)
            
            var croppedImage = image
            
            if self.isCropStatusBar == true
            {
                croppedImage = self.cropStatusBar(image: image)
                croppedImage = self.crop(image: croppedImage, rect: self.cropRect)
                
            }else
            {
                croppedImage = self.crop(image: croppedImage, rect: self.cropRect)
            }
            
            sender.present(sharerViewController, animated: false, completion: nil)
            sharerViewController.screenshotSharer = self
            sharerViewController.setScreenshotImage(image: croppedImage)
            
            self.captureBlock(croppedImage,sharerViewController)
            
            return
        }
        
        self.captureBlock(nil,nil)
    }
    
    open func takeImageOf(view:UIView) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0);
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    open func cropStatusBar(image:UIImage) -> UIImage
    {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        return self.crop(image: image, rect: CGRect(x: 0, y: statusBarHeight, width: image.size.width, height: image.size.height - statusBarHeight))
    }
    
    open func crop(image:UIImage,rect:CGRect) -> UIImage
    {
        if rect == CGRect.zero
        {
            return image
        }
        
        var rect = rect
        rect.origin.x *= image.scale
        rect.origin.y *= image.scale
        rect.size.width *= image.scale
        rect.size.height *= image.scale
        
        let imageRef = image.cgImage!.cropping(to: rect)
        let image = UIImage(cgImage: imageRef!, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    open func dismissSharerViewController()
    {
        sharerViewController?.dismiss(animated: true, completion: {
            
            self.isEnabled = true
            
        })
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
}
