//
//  GHWProgress.swift
//  11GHWColorProgress
//
//  Created by 郭宏伟 on 2017/7/27.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWProgress: UIView, CAAnimationDelegate {

    let gradientLayer = CAGradientLayer()
    let maskLayer = CALayer()
    
    var progress: CGFloat = 0.0 {
        didSet {
            reConfigUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func reConfigUI() {
        maskLayer.frame = CGRect(x: 0.0, y: 0.0, width: progress * bounds.size.width, height: bounds.size.height)
    }
    
    private func configUI() {
        let whiteBG = CALayer()
        whiteBG.frame = bounds
        whiteBG.cornerRadius = bounds.size.height / 2.0
        whiteBG.borderColor = UIColor.white.cgColor
        whiteBG.borderWidth = 1.0
        layer.addSublayer(whiteBG)
        
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.size.height / 2.0
        gradientLayer.borderColor = UIColor.white.cgColor
        gradientLayer.borderWidth = 1.0
        
        var colors = [CGColor]()
        for hue in stride(from: 0, through: 360, by: 5) {
            let color = UIColor(hue: CGFloat(hue)/360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor
            colors.append(color)
        }
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.addSublayer(gradientLayer)
        
        reConfigUI()
        maskLayer.cornerRadius = bounds.size.height/2.0
        maskLayer.backgroundColor = UIColor.white.cgColor
        gradientLayer.mask = maskLayer
        
    }
    
    private func performAnimation() {
        var colors = gradientLayer.colors
        let color = colors?.popLast() as! CGColor
        colors?.insert(color, at: 0)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = colors
        animation.duration = 0.2
        animation.fillMode = kCAFillModeForwards
        animation.delegate = self
        gradientLayer.add(animation, forKey: "gradient")
        gradientLayer.colors = colors
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performAnimation()
    }
}












