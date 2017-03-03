//
//  ScreenshotSharerUtility.swift
//  ScreenshotSharer
//
//  Created by Yagiz Gurgul on 03/03/2017.
//  Copyright © 2017 Yagiz Gurgul. All rights reserved.
//

import UIKit

extension UIViewController
{
    func topMostViewController() -> UIViewController
    {
        if let presentedViewController = self.presentedViewController
        {
            return presentedViewController.topMostViewController()
            
        }else {
            for view in self.view.subviews
            {
                if let subViewController = view.next
                {
                    if subViewController is UIViewController
                    {
                        let viewController = subViewController as! UIViewController
                        return viewController.topMostViewController()
                    }
                }
            }
            return self
        }
    }
}

class ScreenshotSharerUtility
{
    static func findTopMostViewController() -> UIViewController?
    {
        return UIApplication.shared.keyWindow?.rootViewController?.topMostViewController()
    }
    
    static func findTopMostWindow() -> UIWindow?
    {
        return UIApplication.shared.keyWindow?.rootViewController?.topMostViewController().view.window
    }
}
