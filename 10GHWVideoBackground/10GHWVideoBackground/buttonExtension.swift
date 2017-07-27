//
//  buttonExtension.swift
//  10GHWVideoBackground
//
//  Created by 郭宏伟 on 2017/7/27.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func buttonTitle(configTitle title: String) {
        setTitle(title, for: .normal)
        titleLabel?.textColor = .white
        layer.cornerRadius = 5
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
}
