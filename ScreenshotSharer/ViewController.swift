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

