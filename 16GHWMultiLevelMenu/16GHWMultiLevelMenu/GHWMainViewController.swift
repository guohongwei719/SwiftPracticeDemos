//
//  GHWMainViewController.swift
//  16GHWMultiLevelMenu
//
//  Created by 郭宏伟 on 2017/8/1.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

struct City {
    let name: String
    let alias: String
}

struct Province {
    let name: String
    var isOpen: Bool
    let cities: [City]
}

class GHWMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView(frame: kScreenRect, style: .plain)
    var datas = [Province]()
    let cellIdentifier = "cellIdentifier"
    let headerIdentifier = "headerIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configData()
        configUI()
    }
    
    func configData() {
        let provincesDic = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Province", ofType: "plist")!)
        
        provincesDic?.enumerateKeysAndObjects({ (key, value, xxx) in
            var cityArray = [City]()
            let citiesDic = value as! NSDictionary

            for key in citiesDic.allKeys {
                let city = City(name: key as! String, alias: citiesDic[key] as! String)
                cityArray.append(city)
            }
            let province = Province(name: key as! String, isOpen: false, cities: cityArray)
            datas.append(province)
        })
    }
    
    func configUI() {
     
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(GHWHeadView.self, forCellReuseIdentifier: headerIdentifier)
        tableView.register(GHWHeadView.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        view.addSubview(tableView)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].isOpen ? datas[section].cities.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
        let city = datas[indexPath.section].cities[indexPath.row]
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = city.alias
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! GHWHeadView
        
        
        func addGes() {
            let ges = UITapGestureRecognizer(target: self, action: #selector(tapHeader(sender:)))
            ges.tag = section
            headerView.addGestureRecognizer(ges)
        }
        
        if let ges = headerView.gestureRecognizers {
            if ges.count == 0 {
                addGes()
            }
        } else {
            addGes()
        }
        (headerView.gestureRecognizers?.first as! UITapGestureRecognizer).tag = section
        
        headerView.configData(provinceData: datas[section])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tapHeader(sender: UITapGestureRecognizer) {
        print("test")
        datas[sender.tag].isOpen = !(datas[sender.tag].isOpen)
        tableView.reloadSections([sender.tag], with: .fade)
    }
}

var key: UInt8 = 0

extension UITapGestureRecognizer {
    var tag: Int {
        get {
            return objc_getAssociatedObject(self, &key) as! Int
        }
        
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}





















































