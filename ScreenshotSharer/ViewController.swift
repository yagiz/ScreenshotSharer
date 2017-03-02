//
//  ViewController.swift
//  ScreenshotSharer
//
//  Created by Yagiz Gurgul on 01/03/2017.
//  Copyright © 2017 Yagiz Gurgul. All rights reserved.
//

import UIKit
//import ScreenshotSharer

class ViewController: UIViewController {

    let sssharer = ScreenshotSharer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sssharer.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
            
            //this block is called when the user took a screenshot
            //image is image of given view and it may be cropped according to cropRect.
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

