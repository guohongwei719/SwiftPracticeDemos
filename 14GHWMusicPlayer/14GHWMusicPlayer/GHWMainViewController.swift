//
//  GHWMainViewController.swift
//  14GHWMusicPlayer
//
//  Created by 郭宏伟 on 2017/7/28.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit
import AVFoundation

class GHWMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate{

    let tableView = UITableView(frame: kScreenRect)
    let musicpath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first?.appending("/music")
    let fileManager = FileManager.default
    var musicArray = [String]()
    var audioPlayer : AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        saveMusic()
        readMusic()
    }
    
    func configUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
    }

    func saveMusic() {
        print("\(musicpath!)")
        let names = ["成都", "童话镇"]
        if fileManager.fileExists(atPath: musicpath!) {
            print("已经存在了")
        } else {
            do {
                try fileManager.createDirectory(atPath: musicpath!, withIntermediateDirectories: true, attributes: nil)

            } catch let err as NSError {
                print("创建失败：\(String(describing: err.localizedFailureReason))")

            }
        }
        
        for name in names {
            let fromPath = Bundle.main.path(forResource: name, ofType: "m4r")
            let toPath = musicpath?.appending("/\(name).m4r")
            if fileManager.fileExists(atPath: toPath!) {
                print("那里已经存在了")
                continue
            }
            do {
                try fileManager.copyItem(atPath: fromPath!, toPath: toPath!)
                print("移动成功")
            } catch let err as NSError {
                print("移动失败：\(String(describing: err.localizedFailureReason))")
            }
        }
        
        
    }
    
    func readMusic() {
        do {
            try musicArray = fileManager.contentsOfDirectory(atPath: musicpath!)
        } catch let err as NSError {
            print("查询失败：\(String(describing: err.localizedFailureReason))")

        }
        tableView.reloadData()
    }
    
    func play(musicPath : String) {
        if (audioPlayer != nil) {
            audioPlayer?.stop()
            audioPlayer = nil
        }
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicPath))
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch let err as NSError {
            print("播放失败：\(String(describing: err.localizedFailureReason))")

        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test") ?? UITableViewCell(style: .default, reuseIdentifier: "test")
        cell.textLabel?.text = musicArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        play(musicPath: musicpath!.appending("/\(musicArray[indexPath.row])"))
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer = nil
    }
}
