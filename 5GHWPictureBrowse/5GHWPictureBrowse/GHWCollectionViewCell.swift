//
//  GHWCollectionViewCell.swift
//  5GHWPictureBrowse
//
//  Created by 郭宏伟 on 2017/7/26.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWCollectionViewCell: UICollectionViewCell {
    
    let featureImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kCellWidth, height: kCellHeight))
    let labelTitle = UILabel(frame: CGRect(x: 0, y: kCellHeight - 50, width: kCellWidth, height: 20))
    let labelDes = UILabel(frame: CGRect(x: 0, y: kCellHeight - 30, width: kCellWidth, height: 30))
    
    
    var data : GHWItemModel? {
        didSet {
            configData()
        }
    }
    
    private func configData() {
        featureImageView.image = data?.featureImage
        labelTitle.text = data?.title
        labelDes.text = data?.descriptions
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        configUI()
    }
    
    func configUI() {
        featureImageView.contentMode = .scaleToFill
        labelTitle.backgroundColor = .gray
        labelTitle.textColor = .white
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 16, weight: 4)

        labelDes.backgroundColor = .gray
        labelDes.textColor = .white
        labelDes.textAlignment = .center
        labelDes.numberOfLines = 0;
        labelDes.font = UIFont.systemFont(ofSize: 10)

        contentView.addSubview(featureImageView)
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelDes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
