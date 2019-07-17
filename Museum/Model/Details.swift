//
//  Details.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import Foundation
import UIKit

class Floorinfo {
    
    var name: String
    var desc:String
    var img1:UIImage
    var img2:UIImage
    init(name: String,desc:String,img1:UIImage,img2:UIImage) {
        self.name = name
        self.desc = desc
        self.img1 = img1
        self.img2 = img2
    }
    
}


class FloorDetail {
    
    var floorDetail:String
    var name: String
    var desc:String
    var seenStatus:Bool
    var img:UIImage
    init(name: String,status:Bool,fDetail:String,desc:String,img:UIImage) {
        self.name = name
        self.seenStatus = status
        self.floorDetail = fDetail
        self.desc = desc
        self.img = img
    }
    
}
