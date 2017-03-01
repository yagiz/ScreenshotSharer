//
//  ScreenshotSharerProtocol.swift
//  ScreenshotCapturer
//
//  Created by Yagiz Gurgul on 27/02/2017.
//  Copyright © 2017 Yagiz Gurgul. All rights reserved.
//

import UIKit

public protocol ScreenshotSharerViewControllerProtocol
{
    func setScreenshotImage(image:UIImage)
    
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
}

open class ScreenshotSharerViewController: UIViewController, ScreenshotSharerViewControllerProtocol
{
    
    open weak var screenshotSharer:ScreenshotSharer?
    
    open func setScreenshotImage(image:UIImage)
    {
    }
    
    
    
    open func setShareTitle(title:String)
    {
    }

    open func setShareDescription(description:String)
    {
    }
    
    open func setShareButtonTitle(title:String)
    {
    }
    
    
    
    open func setShareTitleFont(font:UIFont)
    {
    }
    
    open func setShareDescriptionFont(font:UIFont)
    {
    }
    
    open func setShareButtonTitleFont(font:UIFont)
    {
    }
    
    
    
    open func setShareTitleTextColor(color:UIColor)
    {
        
    }
    
    open func setShareDescriptionTextColor(color:UIColor)
    {
        
    }
    
    open func setShareButtonTitleColor(color:UIColor)
    {
        
    }
    
    open func setShareButtonBackgroundColor(color:UIColor)
    {
        
    }
}

