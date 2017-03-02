/*
 MIT License
 
 Copyright (c) 2017 Yagiz Gurgul
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

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

