//
//  GHWMainViewController.swift
//  15GHWTumblrMenu
//
//  Created by 郭宏伟 on 2017/7/31.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.layer.contents = UIImage(named: "8")?.cgImage
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(GHWMenuViewController(), animated: true, completion: nil)
    }
}
