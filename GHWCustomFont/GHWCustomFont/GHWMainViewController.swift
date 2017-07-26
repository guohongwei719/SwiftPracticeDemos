//
//  GHWMainViewController.swift
//  GHWCustomFont
//
//  Created by 郭宏伟 on 2017/7/25.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

/*
 let cell = tableViewTop.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)

 */

import UIKit

class GHWMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableViewTop : UITableView = UITableView(frame: CGRect(x : 0, y : 0, width : kScreenWidth, height : kScreenHeight * 2/3), style: .plain)
    let buttonBottom : UIButton = UIButton(frame: CGRect(x: 0, y: kScreenHeight * 2/3, width: kScreenWidth, height: kScreenHeight/3))
    let dataArray = ["我就测试一下", "你说好不好", "真的很难吗", "这就奇怪了"]
    let fontArray = ["MFJinHei_Noncommercial-Regular", "MFTongXin_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    var fontNum = 0
    let identifier = "tableViewTop"
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configUI() {
        tableViewTop.delegate = self
        tableViewTop.dataSource = self
        tableViewTop.backgroundColor = .black
        
        buttonBottom.backgroundColor = .orange
        buttonBottom.setTitle("更换字体", for: .normal)
        buttonBottom.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        
        self.view.addSubview(tableViewTop)
        self.view.addSubview(buttonBottom)
    }
    
    func changeFont() {
        print("test")
        fontNum = (fontNum + 1)%fontArray.count
        tableViewTop.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewHeight = kScreenHeight * 2/3
        return tableViewHeight/CGFloat(dataArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Attention
        let cell = tableViewTop.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: fontArray[fontNum], size: 20)
        cell.backgroundColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewTop.deselectRow(at: indexPath, animated: true)
        let cell = tableViewTop.cellForRow(at: indexPath)
        print("字体为" +  (cell?.textLabel?.font.fontName)!)
        
    }


}
