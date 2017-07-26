//
//  GHWMainViewController.swift
//  6GHWCurrentLocation
//
//  Created by 郭宏伟 on 2017/7/26.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit
import CoreLocation

class GHWMainViewController: UIViewController, CLLocationManagerDelegate {

    let bottomView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    let buttonBottom = UIButton(frame: CGRect(x: 30, y: kScreenHeight - 100, width: kScreenWidth - 60, height: 80))
    let labelTop = UILabel(frame: CGRect(x: 0, y: 60, width: kScreenWidth, height: 30))
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        configUI()
    }
    
    func configUI() {
        view.layer.contents = UIImage(named: "bg")?.cgImage
        bottomView.frame = kScreenRect
        
        buttonBottom.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
        buttonBottom.setTitle("定位", for: .normal)
        buttonBottom.setBackgroundImage(UIImage(named:"Find my location"), for: .normal)
        
        labelTop.textAlignment = .center
        labelTop.backgroundColor = .clear
        labelTop.textColor = .white
        labelTop.text = "定位我的位置"
        
        view.addSubview(bottomView)
        view.addSubview(buttonBottom)
        view.addSubview(labelTop)
        
    }
    
    func findMyLocation() {
        print("test")
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        labelTop.text = "error:" + error.localizedDescription
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("test")
        if let newLocal = locations.first {
            CLGeocoder().reverseGeocodeLocation(newLocal, completionHandler: { (pms, err) in
                if (pms?.last?.location?.coordinate) != nil {
                    manager.stopUpdatingLocation()
                    let placemark: CLPlacemark = (pms?.last)!
                    let name: String? = placemark.name
                    let thoroughfare: String? = placemark.thoroughfare
                    let subThoroughfare: String? = placemark.subThoroughfare
                    let locality: String? = placemark.locality
                    
                    let str1 = String(name ?? "-")
                    let str2 = String(thoroughfare ?? "-")
                    let str3 = String(subThoroughfare ?? "-")
                    let str4 = String(locality ?? "-")
                    
                    self.labelTop.text = str1! + str2! + str3! + str4!
                }
            })
        }
    }
    
}


















