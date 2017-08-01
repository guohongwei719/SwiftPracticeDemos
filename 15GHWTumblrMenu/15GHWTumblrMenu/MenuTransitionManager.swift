//
//  MenuTransitionManager.swift
//  15GHWTumblrMenu
//
//  Created by 郭宏伟 on 2017/7/31.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    private var presenting = false
    
    func offStage(amount : CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    func offStageMenuController(menuVC: GHWMenuViewController) {
        menuVC.view.alpha = 0
        
        let topRowOffset: CGFloat = 300.0
        let middleRowOffset: CGFloat = 150.0
        let bottomRowOffset: CGFloat = 50.0
        
        menuVC.buttons[0].transform = offStage(amount: -topRowOffset)
        menuVC.buttons[1].transform = offStage(amount: topRowOffset)
        menuVC.buttons[2].transform = offStage(amount: -middleRowOffset)
        menuVC.buttons[3].transform = offStage(amount: middleRowOffset)
        menuVC.buttons[4].transform = offStage(amount: -bottomRowOffset)
        menuVC.buttons[5].transform = offStage(amount: bottomRowOffset)
    }
    
    func onStageMenuController(menuVC: GHWMenuViewController) {
        menuVC.view.alpha = 1
        menuVC.buttons[0].transform = CGAffineTransform.identity
        menuVC.buttons[1].transform = CGAffineTransform.identity
        menuVC.buttons[2].transform = CGAffineTransform.identity
        menuVC.buttons[3].transform = CGAffineTransform.identity
        menuVC.buttons[4].transform = CGAffineTransform.identity
        menuVC.buttons[5].transform = CGAffineTransform.identity
    }
    
    //MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: .from)!, transitionContext.viewController(forKey: .to)!)
        let menuVC = !presenting ? screens.from as! GHWMenuViewController : screens.to as! GHWMenuViewController
        let bottomVC = !presenting ? screens.to : screens.from
        let menuV = menuVC.view
        let bottomV = bottomVC.view
        if self.presenting {
            offStageMenuController(menuVC: menuVC)
        }
        
        container.addSubview(bottomV!)
        container.addSubview(menuV!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: { 
            self.presenting ? self.onStageMenuController(menuVC: menuVC) : self.offStageMenuController(menuVC: menuVC)
        }) { finished in
            transitionContext.completeTransition(true)
            if self.presenting {
                UIApplication.shared.keyWindow?.addSubview(screens.from.view)
            }
            UIApplication.shared.keyWindow?.addSubview(screens.to.view)
        }
    }
    //MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
