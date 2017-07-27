//
//  GHWMainViewController.swift
//  11GHWColorProgress
//
//  Created by 郭宏伟 on 2017/7/27.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMainViewController: UIViewController {
    let progresss = GHWProgress(frame:CGRect(x: 20, y: 200, width: kScreenWidth - 40, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    func configUI() {
        view.addSubview(progresss)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.progresss.progress = self.progresss.progress + 0.03
            if self.progresss.progress >= 1.0 {
                timer.invalidate()
            }
        }
    }
}
