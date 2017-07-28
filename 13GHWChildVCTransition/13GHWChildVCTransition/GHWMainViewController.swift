//
//  GHWMainViewController.swift
//  13GHWChildVCTransition
//
//  Created by 郭宏伟 on 2017/7/28.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

let notificationName = "notificationName"

class GHWMainViewController: UIViewController {

    var currentVCNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(GHWAViewController())
        addChildViewController(GHWBViewController())
        view.addSubview((childViewControllers.first?.view)!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeVC), name: NSNotification.Name(notificationName), object: nil)
    }

    func changeVC() {
        print("test")
        
        transition(from: currentVCNumber == 0 ? childViewControllers.first! : childViewControllers.last!, to: currentVCNumber == 0 ? childViewControllers.last! : childViewControllers.first!,
                   duration: 1,
                   options: currentVCNumber == 0 ? .transitionFlipFromLeft : .transitionFlipFromRight,
                   animations: nil,
                   completion: nil)
        
        currentVCNumber = currentVCNumber == 0 ? 1 : 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
