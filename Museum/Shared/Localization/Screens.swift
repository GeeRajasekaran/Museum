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
    case becon3ContentTitleForBaskaraSat = "becon3ContentTitleForBaskaraSat"
    case becon3ContentDescForBaskaraSat = "becon3ContentDescForBaskaraSat"
    case artWorkSat =  "artWorkSat"
    case artWorkSatAuthor = "artWorkSatAuthor"
    var localized: String {
        return self.rawValue.localized(tableName: "AR")
    }
}

