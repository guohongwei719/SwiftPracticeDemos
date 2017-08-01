//
//  GHWMenuViewController.swift
//  15GHWTumblrMenu
//
//  Created by 郭宏伟 on 2017/7/31.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMenuViewController: UIViewController {

    var buttons = [UIButton]()
    let transitionManager = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        transitioningDelegate = transitionManager
        let buttonWidth = kScreenWidth/2
        let buttonHeight = kScreenHeight/3
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        let names = ["Audio","Chat","Link","Photo","Quote","Text"]

        for i in 0...5 {
            let button = UIButton(frame: CGRect(x: CGFloat(i%2) * buttonWidth, y:  CGFloat(i/2) * buttonHeight, width: buttonWidth, height: buttonHeight))
            button.setTitle(names[i], for: .normal)
            button.setImage(UIImage(named:names[i]), for: .normal)
            button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
            button.alignContentVerticallyByCenter()
            buttons.append(button)
            view.addSubview(button)
        }
    }
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
