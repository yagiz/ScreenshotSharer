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

open class ScreenshotSharerMinimal: ScreenshotSharerViewController {
    
    @IBOutlet weak var screenshotImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var imageViewRatioConstraint: NSLayoutConstraint!
    
    override open func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override open func setScreenshotImage(_ image: UIImage)
    {
        self.screenshotImageView.image = image
    }
    
    
    
    
    
    override open func setShareTitleText(_ text:String)
    {
        self.titleLabel.text = text
    }
    
    override open func setShareDescriptionText(_ text:String)
    {
        self.descriptionLabel.text = text
    }
    
    override open func setShareButtonTitleText(_ text:String)
    {
        self.shareButton.setTitle(text, for: .normal)
    }
    
    
    
    
    
    override open func setShareTitleFont(_ font: UIFont)
    {
        self.titleLabel.font = font
    }
    
    override open func setShareDescriptionFont(_ font: UIFont)
    {
        self.descriptionLabel.font = font
    }
    
    override open func setShareButtonTitleFont(_ font: UIFont)
    {
        self.shareButton.titleLabel?.font = font
    }
    
    
    
    
    
    override open func setShareTitleTextColor(_ color: UIColor)
    {
        self.titleLabel.textColor = color
    }
    
    override open func setShareDescriptionTextColor(_ color: UIColor)
    {
        self.descriptionLabel.textColor = color
    }
    
    override open func setShareButtonTitleColor(_ color: UIColor)
    {
        self.shareButton.setTitleColor(color, for: .normal)
    }
    
    override open func setShareButtonBackgroundColor(_ color: UIColor)
    {
        self.shareButton.backgroundColor = color
    }
    
    
    
    
    @IBAction func shareButtonAction(_ sender: Any)
    {
        let activityItem: [AnyObject] = [self.screenshotImageView.image as AnyObject]
        let activityViewController = UIActivityViewController(activityItems: activityItem as [AnyObject], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
        activityViewController.completionWithItemsHandler = {
            (s, ok, items, error) in
            
            self.screenshotSharer()?.dismissSharerViewController(true)
        }
    }
    
    @IBAction func dismissButtonAction(_ sender: Any)
    {
        self.screenshotSharer()?.dismissSharerViewController(false)
    }
}
