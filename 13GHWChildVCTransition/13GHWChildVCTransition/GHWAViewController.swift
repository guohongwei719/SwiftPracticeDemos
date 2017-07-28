//
//  GHWAViewController.swift
//  13GHWChildVCTransition
//
//  Created by 郭宏伟 on 2017/7/28.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(gesture)
    }

    func tap() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
}
