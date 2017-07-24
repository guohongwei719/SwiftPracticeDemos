//
//  GHWViewController.swift
//  GHWSimpleClock
//
//  Created by 郭宏伟 on 2017/7/24.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWViewController: UIViewController {
    
    let labelTop = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/2))
    let buttonLeft = UIButton(frame: CGRect(x: 0, y: kScreenHeight/2, width: kScreenWidth/2, height: kScreenHeight/2))
    let buttonRight = UIButton(frame: CGRect(x: kScreenWidth/2, y: kScreenHeight/2, width: kScreenWidth/2, height: kScreenHeight/2))

    var timer : Timer?
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configUI()
    }
    
    func configUI() {
        self.labelTop.backgroundColor = .yellow
        self.labelTop.text = "12"
        self.labelTop.textColor = .white
        self.labelTop.font = UIFont.systemFont(ofSize: kScreenHeight/4)
        self.labelTop.textAlignment = .center
        
        
        self.buttonLeft.backgroundColor = .orange
        self.buttonLeft.setTitle("开始", for: .normal)
        self.buttonLeft.setTitle("结束", for: .selected)
        
        
        self.buttonRight.backgroundColor = .blue
        self.buttonRight.setTitle("暂停", for: .normal)
        self.buttonRight.setTitle("继续", for: .selected)
        
        [self.buttonLeft, self.buttonRight].forEach { (one) in
            one.addTarget(self, action: #selector(buttonTap(sender:)), for: .touchUpInside)
        }
        
        self.view.addSubview(self.labelTop)
        self.view.addSubview(self.buttonLeft)
        self.view.addSubview(self.buttonRight)
    }
    
    func buttonTap(sender : UIButton) {
        switch sender {
        case self.buttonLeft:
            sender.isSelected = !sender.isSelected
            sender.isSelected ? start() : stop()
            break
        case self.buttonRight:
            sender.isSelected = !sender.isSelected
            sender.isSelected ? pause() : continue1()
            break
        default:
            return
        }
    }

    
    func start() {
        print("start")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configLabel), userInfo: nil, repeats: true)
    }
    
    func stop() {
        print("stop")
        self.labelTop.text = "0"
        self.timer?.invalidate()
        self.timer = nil
        n = 0;
    }
    
    func pause() {
        if !self.buttonLeft.isSelected {
            return
        }
        print("pause")
        self.timer?.invalidate()
    }
    
    func continue1() {
        if !self.buttonLeft.isSelected {
            return
        }
        print("continue")
        self.start()
    }
    
    func configLabel() {
        n = n + 1;
        self.labelTop.text = "\(n)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
