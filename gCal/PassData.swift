//
//  PassData.swift
//  gCal
//
//  Created by Gaurav Pathak on 3/28/17.
//  Copyright © 2017 gpmax. All rights reserved.
//

import UIKit

class PassData {
    var from:Unit = Unit.init()
    var to:Unit = Unit.init()
    var category:String = ""
    static let sharedInstance = PassData()
}
