//
//  GHWItemModel.swift
//  5GHWPictureBrowse
//
//  Created by 郭宏伟 on 2017/7/26.
//  Copyright © 2017年 郭宏伟. All rights reserved.
//

import UIKit

class GHWItemModel: NSObject {
    var title: String?
    var featureImage: UIImage?
    var descriptions: String?
    
    // 这边不需要override，只有真正敲代码才能知道这些问题了，所以删掉
    init(title: String, descriptions: String, featureImage: UIImage) {
        self.featureImage = featureImage
        self.title = title
        self.descriptions = descriptions
    }
    
    static func fetchDatas() -> [GHWItemModel] {
        return [
            GHWItemModel(title: "Hello there, i miss u.", descriptions: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImage: UIImage(named: "hello")!),
            GHWItemModel(title: "🐳🐳🐳🐳🐳", descriptions: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImage: UIImage(named: "dudu")!),
            GHWItemModel(title: "Training like this, #bodyline", descriptions: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImage: UIImage(named: "bodyline")!),
            GHWItemModel(title: "I'm hungry, indeed.", descriptions: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImage: UIImage(named: "wave")!),
            GHWItemModel(title: "Dark Varder, #emoji", descriptions: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImage: UIImage(named: "darkvarder")!),
            GHWItemModel(title: "I have no idea, bitch", descriptions: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featureImage: UIImage(named: "hhhhh")!),
        ]
    }
    
}
