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
    
    override open func setScreenshotImage(image: UIImage)
    {
        self.screenshotImageView.image = image
        

        let imageRatioNewConstraint = NSLayoutConstraint(item: self.imageViewRatioConstraint.firstItem,
                                                           attribute: self.imageViewRatioConstraint.firstAttribute,
                                                           relatedBy: self.imageViewRatioConstraint.relation,
                                                           toItem: self.imageViewRatioConstraint.secondItem,
                                                           attribute: self.imageViewRatioConstraint.secondAttribute,
                                                           multiplier: image.size.width / image.size.height,
                                                           constant: self.imageViewRatioConstraint.constant)
        
        self.screenshotImageView.removeConstraint(self.imageViewRatioConstraint)
        self.screenshotImageView.addConstraint(imageRatioNewConstraint)
        self.imageViewRatioConstraint = imageRatioNewConstraint
        self.view.layoutIfNeeded()
    }
    
    
    
    override open func setShareTitle(title: String)
    {
        super.setShareTitle(title: title)
        self.titleLabel.text = title
    }
    
    override open func setShareDescription(description: String)
    {
        super.setShareDescription(description: description)
        self.descriptionLabel.text = description
    }
    
    override open func setShareButtonTitle(title: String)
    {
        super.setShareButtonTitle(title: title)
        self.shareButton.setTitle(title, for: .normal)
    }
    
    
    
    override open func setShareTitleFont(font: UIFont)
    {
        super.setShareTitleFont(font: font)
        self.titleLabel.font = font
    }
    
    override open func setShareDescriptionFont(font: UIFont)
    {
        super.setShareDescriptionFont(font: font)
        self.descriptionLabel.font = font
    }
    
    override open func setShareButtonTitleFont(font: UIFont)
    {
        super.setShareButtonTitleFont(font: font)
        self.shareButton.titleLabel?.font = font
    }
    
    
    override open func setShareTitleTextColor(color: UIColor) 
    {
        super.setShareTitleTextColor(color: color)
        self.titleLabel.textColor = color
    }
    
    override open func setShareDescriptionTextColor(color: UIColor)
    {
        super.setShareDescriptionTextColor(color: color)
        self.descriptionLabel.textColor = color
    }
    
    override open func setShareButtonTitleColor(color: UIColor)
    {
        super.setShareButtonTitleColor(color: color)
        self.shareButton.setTitleColor(color, for: .normal)
    }
    
    override open func setShareButtonBackgroundColor(color: UIColor)
    {
        super.setShareButtonBackgroundColor(color: color)
        self.shareButton.backgroundColor = color
    }
    
    @IBAction func shareButtonAction(_ sender: Any)
    {
        let activityItem: [AnyObject] = [self.screenshotImageView.image as AnyObject]
        let activityViewController = UIActivityViewController(activityItems: activityItem as [AnyObject], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
        activityViewController.completionWithItemsHandler = {
            (s, ok, items, error) in
            
            if let screenshotSharer = self.screenshotSharer
            {
                screenshotSharer.dismissSharerViewController()
            }
        }
    }
    
    @IBAction func dismissButtonAction(_ sender: Any)
    {
        if let screenshotSharer = self.screenshotSharer
        {
            screenshotSharer.dismissSharerViewController()
        }
    }
}
