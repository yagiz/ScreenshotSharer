//
//  ScreenshotShareViewController.swift
//  ScreenshotCapturer
//
//  Created by Yagiz Gurgul on 27/02/2017.
//  Copyright © 2017 Yagiz Gurgul. All rights reserved.
//

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
