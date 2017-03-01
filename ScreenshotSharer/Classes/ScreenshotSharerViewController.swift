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
}

open class ScreenshotSharerViewController: UIViewController, ScreenshotSharerViewControllerProtocol
{
    var screenshotImage:UIImage!
    var shareTitle:String!
    var shareDescription:String!
    var shareButtonTitle:String!
    
    var shareTitleFont:UIFont!
    var shareDescriptionFont:UIFont!
    var shareButtonTitleFont:UIFont!
    
    open func setScreenshotImage(image:UIImage)
    {
        self.screenshotImage = image
    }
    
    open func setShareTitle(title:String)
    {
        self.shareTitle = title
    }

    open func setShareDescription(description:String)
    {
        self.shareDescription = description
    }
    
    open func setShareButtonTitle(title:String)
    {
        self.shareButtonTitle = title
    }
    
    open func setShareTitleFont(font:UIFont)
    {
        self.shareTitleFont = font
    }
    
    open func setShareDescriptionFont(font:UIFont)
    {
        self.shareDescriptionFont = font
    }
    
    open func setShareButtonTitleFont(font:UIFont)
    {
        self.shareButtonTitleFont = font
    }
}

