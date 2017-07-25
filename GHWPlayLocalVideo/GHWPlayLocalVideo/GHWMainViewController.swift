//
//  GHWMainViewController.swift
//  GHWPlayLocalVideo
//
//  Created by 郭宏伟 on 2017/7/25.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class GHWMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableViewVideo : UITableView = UITableView(frame: kScreenRect, style: .plain)
    
    // 不加问号的话会报错：class has no initializers, 这里凡是没有初始化的都要加上问号
    var player : AVPlayer?
    var playerViewController : AVPlayerViewController?
    let dataArray = [
        VideoModel(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        VideoModel(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        VideoModel(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        VideoModel(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        VideoModel(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        VideoModel(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    let identifierStr = "identifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player = nil
        playerViewController = nil
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


    func configUI() {
        tableViewVideo.delegate = self
        tableViewVideo.dataSource = self
        tableViewVideo.register(GHWVideoCell.self, forCellReuseIdentifier: identifierStr)
        self.view.addSubview(tableViewVideo)
    }

    func playVideo() {        
        let videoPath = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        if videoPath == nil {
            print("视频不存在")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: videoPath!))
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
        self.present(playerViewController!, animated: true) {
            self.player!.play()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierStr, for: indexPath) as! GHWVideoCell
        
        cell.configWithData(videoInfo: dataArray[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kScreenHeight/3
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo()
    }
}
