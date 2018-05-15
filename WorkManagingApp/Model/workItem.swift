//
//  workItem.swift
//  WorkManagingApp
//
//  Created by David Perez on 4/22/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import Foundation
import UIKit

struct managerObject {
    let name: String
    let age: String
    let workAssociated: [workObject]?
}

struct workObject {
    let jobName: UITextField
    let jobDescription: UITextField
    let jobPrice: UITextField
    let jobLocation: (lat: String, long: String)
}



