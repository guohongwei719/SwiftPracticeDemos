//
//  GHWMainViewController.swift
//  GHWWelcomView
//
//  Created by 郭宏伟 on 2017/7/25.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

/*
 
 // 要注意的地方，1. imageArray.enumerated() 2. CGFloat(index)

 */

import UIKit

class GHWMainViewController: UIViewController, UIScrollViewDelegate {

    let mainScrollView = UIScrollView(frame: kScreenRect)
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: kScreenHeight - 30, width: kScreenWidth, height: 20))
    let imageArray = ["first", "second", "three"]
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    func configUI() {
        mainScrollView.contentSize = CGSize(width: (CGFloat)(imageArray.count) * kScreenWidth, height: kScreenHeight)
        mainScrollView.isPagingEnabled = true
        mainScrollView.delegate = self
        for (index, value) in imageArray.enumerated() {
            let contentImageView = UIImageView(frame: CGRect(x: CGFloat(index) * kScreenWidth, y: 0, width: kScreenWidth, height: kScreenHeight))
            contentImageView.image = UIImage(named: value)
            contentImageView.contentMode = .scaleAspectFill
            contentImageView.clipsToBounds = true
            mainScrollView.addSubview(contentImageView)
        }
        
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .gray
        
        view.addSubview(mainScrollView)
        view.addSubview(pageControl)
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / kScreenWidth))
        if index >= 0 && index <= 2 {
            pageControl.currentPage = index
        }
    }
}
