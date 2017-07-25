//
//  GHWVideoCell.swift
//  GHWPlayLocalVideo
//
//  Created by 郭宏伟 on 2017/7/25.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

struct VideoModel {
    let image : String
    let title : String
    let source : String
}

class GHWVideoCell: UITableViewCell {

    let videoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/3))
    let videoTitle = UILabel(frame: CGRect(x: 0, y: kScreenHeight/3 - 50, width: kScreenWidth, height: 30))
    let videoSource = UILabel(frame: CGRect(x: 0, y: kScreenHeight/3 - 20, width: kScreenWidth, height: 20))
    
    private let playImage = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/3))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configWithData(videoInfo : VideoModel) {
        videoImageView.image = UIImage(named: videoInfo.image)
        videoTitle.text = videoInfo.title
        videoSource.text = videoInfo.source
    }
    
    func configUI() {
        videoImageView.contentMode = .scaleAspectFill
        playImage.contentMode = .center
        playImage.image = UIImage(named: "playBtn")
        videoTitle.textColor = .red
        videoTitle.font = UIFont(name: "Zapfino", size: 24)
        videoTitle.textAlignment = .center
        
        videoSource.textColor = .blue
        videoSource.textAlignment = .center
        videoSource.font = UIFont(name: "Avenir Next", size: 14)
        self.contentView.addSubview(videoImageView)
        self.contentView.addSubview(playImage)
        self.contentView.addSubview(videoTitle)
        self.contentView.addSubview(videoSource)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
