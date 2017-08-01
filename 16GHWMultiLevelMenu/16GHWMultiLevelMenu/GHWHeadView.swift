//
//  GHWHeadView.swift
//  16GHWMultiLevelMenu
//
//  Created by 郭宏伟 on 2017/8/1.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWHeadView: UITableViewHeaderFooterView {

    let imageViewLeft = UIImageView(frame: CGRect(x: 20, y: 10, width: 20, height: 20))
    let labelLeft = UILabel(frame: CGRect(x: 50, y: 10, width: 50, height: 20))
    let labelDetal = UILabel(frame: CGRect(x: kScreenWidth - 80, y: 10, width: 70, height: 20))
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        

        imageViewLeft.image = UIImage(named: "Right")
        labelLeft.text = "湖北省"
        labelDetal.text = "9个市"
        
        addSubview(imageViewLeft)
        addSubview(labelLeft)
        addSubview(labelDetal)
    }
    
    func configData(provinceData: Province) {
        imageViewLeft.image = provinceData.isOpen ? UIImage(named: "Down") : UIImage(named: "Right")
        labelLeft.text = provinceData.name
        labelDetal.text = "\(provinceData.cities.count)个市"
    }
    
}
