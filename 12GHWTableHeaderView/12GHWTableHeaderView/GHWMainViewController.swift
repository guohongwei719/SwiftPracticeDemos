//
//  GHWMainViewController.swift
//  12GHWTableHeaderView
//
//  Created by 郭宏伟 on 2017/7/27.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView(frame: kScreenRect, style: .plain)
    let datas = ["下","拉","可","以","出","现","很","神","奇","的","事","情","yo","yo","yo","yo","yo","yo"]
    let identifier = "identifier"
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeadViewHeight))
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.tableFooterView = UIView()
        tableView.contentInset.top = kHeadViewHeight
        tableView.contentOffset = CGPoint(x: 0, y: -kHeadViewHeight)
        view.addSubview(tableView)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let url = URL(string: "http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg")

        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let _ = data, error == nil else { return }
            DispatchQueue.main.sync {
                self.imageView.image = UIImage(data: data!)
            }
        }
        task.resume()
        view.addSubview(imageView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = datas[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + kHeadViewHeight
        if offsetY < 0 {
            imageView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeadViewHeight - offsetY)
        } else {
            let height = (kHeadViewHeight - offsetY) > 0 ? (kHeadViewHeight - offsetY) : 0
            imageView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)
            imageView.alpha = height/kHeadViewHeight
        }
    }
}
