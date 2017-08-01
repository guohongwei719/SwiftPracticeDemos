//
//  buttonExtension.swift
//  15GHWTumblrMenu
//
//  Created by 郭宏伟 on 2017/7/31.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    func alignContentVerticallyByCenter() {

        
        let imageWidth = imageView?.frame.size.width
        let imageHeight = imageView?.frame.size.height
        let imageLeftMargin = imageView?.frame.origin.x
        let imageRightMargin = frame.size.width - imageLeftMargin! - imageWidth!
        
        let titleWith = titleLabel?.frame.size.width
        let titleHeight = titleLabel?.frame.size.height
        let titleLeftMargin = titleLabel?.frame.origin.x
        let titleRightMargin = frame.size.width - titleLeftMargin! - titleWith!
        
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageLeftMargin!, bottom: titleHeight!, right: -imageRightMargin)
        titleEdgeInsets = UIEdgeInsets(top: imageHeight! + 10, left: -titleLeftMargin!, bottom: 0, right: -titleRightMargin)
    }
}
