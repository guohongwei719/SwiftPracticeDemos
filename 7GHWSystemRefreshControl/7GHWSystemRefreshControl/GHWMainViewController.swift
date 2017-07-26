//
//  GHWMainViewController.swift
//  7GHWSystemRefreshControl
//
//  Created by 郭宏伟 on 2017/7/26.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWMainViewController: UIViewController {

    let tableView = UITableView(frame: kScreenRect, style: .plain)
    let refreshControl = UIRefreshControl()
    
    let newData = ["1111", "2222", "3333", "4444"]
    var dataArray = ["11", "22", "33", "44"]
    let identifier = "identifier"
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    func configUI() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refreshControl
        refreshControl.backgroundColor = .gray
        refreshControl.attributedTitle = NSAttributedString(string: "刷新时间为：\(NSDate())", attributes: [NSForegroundColorAttributeName: UIColor.white])
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(addData), for: .valueChanged)
        
        view.addSubview(tableView)
    }
    
    func addData() {
        dataArray.append(contentsOf: newData)
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension GHWMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text =  String(indexPath.row + 1) + ":" + dataArray[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.backgroundColor = .clear
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30, weight: 10)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
