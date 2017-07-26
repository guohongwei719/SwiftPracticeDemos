//
//  GHWMainViewController.swift
//  5GHWPictureBrowse
//
//  Created by 郭宏伟 on 2017/7/26.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMainViewController: UIViewController {

    let imageViewBG = UIImageView(frame: kScreenRect)
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var collectionView : UICollectionView!
    let identifier = "GHWCollectionViewCell"
    let dataArray = GHWItemModel.fetchDatas()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    func configUI() {
        imageViewBG.image = UIImage(named: "blue")
        blurView.frame = kScreenRect
        
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .horizontal
        myLayout.itemSize = CGSize(width: kCellWidth, height: kCellHeight)
        myLayout.minimumLineSpacing = 20
        myLayout.minimumInteritemSpacing = 20
        myLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x : 0, y : (kScreenHeight - kCellHeight)/2, width : kScreenWidth, height : kCellHeight), collectionViewLayout: myLayout)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = .clear
        collectionView.register(GHWCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(imageViewBG)
        self.view.addSubview(blurView)
        self.view.addSubview(collectionView)
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



}

extension GHWMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GHWCollectionViewCell
        cell.data = dataArray[indexPath.row]
        return cell
    }
}
