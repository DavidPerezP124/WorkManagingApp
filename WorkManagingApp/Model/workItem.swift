//
//  workItem.swift
//  WorkManagingApp
//
//  Created by David Perez on 4/22/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

protocol workDocumentSerializable {
    init?(dictionary:[String:Any])
}

struct managerObject {
    let name: String
    let age: String
    let workAssociated: [workObject]?
}

struct workObject {
  //  let jobName: UITextField
    let jobDescription: String
    let jobPrice: String
    let jobTime: String
  //  let jobLocation: (lat: String, long: String)
    
    var dicitionary: [String: Any] {
        return [
            "jobDescription":jobDescription,
            "jobPrice":jobPrice,
            "jobTime":jobTime
        ]
    }
}

extension workObject: workDocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let jobDescription = dictionary["jobDescription"] as? String,
            let jobPrice = dictionary["jobPrice"] as? String,
            let jobTime = dictionary["jobTime"] as? String
            else {
                return nil
        }
        self.init(jobDescription: jobDescription, jobPrice:jobPrice, jobTime:jobTime )
    }
}


