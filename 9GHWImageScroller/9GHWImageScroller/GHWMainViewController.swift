//
//  GHWMainViewController.swift
//  9GHWImageScroller
//
//  Created by 郭宏伟 on 2017/7/26.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMainViewController: UIViewController, UIScrollViewDelegate {

    let bottomView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    let scrollView = UIScrollView(frame: kScreenRect)
    let imageView = UIImageView(image: UIImage(named: "steve"))
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func configUI()  {
        view.layer.contents = UIImage(named: "steve")?.cgImage
        bottomView.frame = kScreenRect
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        view.addSubview(bottomView)
        view.addSubview(scrollView)
        
        setupZoomScale()
        scrollView.zoomScale = scrollView.minimumZoomScale
        reCenterImage()
    }
    
    func setupZoomScale() {
        let scrollViewSize = scrollView.bounds.size
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let miniScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = miniScale
        scrollView.maximumZoomScale = 3.5
    }
    
    func reCenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageSize = imageView.bounds.size
        let horizontalSpace = imageSize.width < scrollViewSize.width ? (scrollViewSize.width - imageSize.width)/2.0 : 0
        let verticalSpace = imageSize.height < scrollViewSize.height ? (scrollViewSize.height - imageSize.height)/2.0 : 0
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
    
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        reCenterImage()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
