//
//  Screens.swift
//  LocalizationDemo
//
//  Created by CVN on 24/12/18.
//  Copyright © 2018 Agiliztech. All rights reserved.
//

import Foundation
import UIKit
//import TRISA

enum ARStrings: String {
   
    case beconContentTitleForRakeshAstro = "beconContentTitleForRakeshAstro"
    
    
    var localized: String {
        return self.rawValue.localized(tableName: "AR")
    }
}

