//
//  ViewController.swift
//  ScreenshotSharer
//
//  Created by Yagiz Gurgul on 01/03/2017.
//  Copyright © 2017 Yagiz Gurgul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ScreenshotSharer.shared.registerViewCapturer(view: self.view, cropRect: CGRect.zero, sender: self) { (image, sharerViewController) in
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

