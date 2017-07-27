//
//  GHWMainViewController.swift
//  10GHWVideoBackground
//
//  Created by 郭宏伟 on 2017/7/27.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
class GHWMainViewController: UIViewController, AVPlayerViewControllerDelegate{

    let buttonLogin = UIButton(frame: CGRect(x: 30, y: kScreenHeight - 150, width: kScreenWidth - 60, height: 50))
    let buttonRegister = UIButton(frame: CGRect(x: 30, y: kScreenHeight - 75, width: kScreenWidth - 60, height: 50))
    let mediaPlayerVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configMediaPlayer()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func configUI() {
        buttonLogin.buttonTitle(configTitle: "登录")
        buttonRegister.buttonTitle(configTitle: "注册")
        buttonLogin.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        buttonRegister.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
        view.addSubview(buttonLogin)
        view.addSubview(buttonRegister)
    }
    
    func buttonTap(_ sender: UIButton) {
        print("test" + (sender.titleLabel?.text)!)
    }

    
    func configMediaPlayer() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        mediaPlayerVC.player = AVPlayer(url: url)
        mediaPlayerVC.videoGravity = AVLayerVideoGravityResizeAspectFill
        mediaPlayerVC.showsPlaybackControls = false
        mediaPlayerVC.view.alpha = 1
        mediaPlayerVC.view.frame = kScreenRect
        NotificationCenter.default.addObserver(self, selector: #selector(repeatPlay), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: mediaPlayerVC.player?.currentItem)
        view.addSubview(mediaPlayerVC.view)
        view.sendSubview(toBack: mediaPlayerVC.view)
        mediaPlayerVC.player?.play()
    }
    
    func repeatPlay() {
        mediaPlayerVC.player?.seek(to: kCMTimeZero)
        mediaPlayerVC.player?.play()
    }
}
