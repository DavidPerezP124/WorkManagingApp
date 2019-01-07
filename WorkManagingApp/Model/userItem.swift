//
//  userItem.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/13/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary:[String: Any])
}

struct userItem {
    
    var mail: String
    var userName: String
    var passWord: String
    
    var dictionary:[String: Any]{
        return [
        "mail":mail,
        "userName":userName,
        "password":passWord
        ]
    }
}

extension userItem: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let mail = dictionary["mail"] as? String,
            let userName = dictionary["userName"] as? String,
            let passWord = dictionary["passWord"] as? String
            else {
                return nil
        }
        self.init(mail:mail, userName:userName, passWord:passWord)
    }
}

