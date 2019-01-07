//
//  textfielView.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/12/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import Foundation
import UIKit

class textFieldView: UIView, UITextFieldDelegate {
    
    
    let mainView: UIView = {
       let m = UIView()
        m.translatesAutoresizingMaskIntoConstraints = false
       // m.backgroundColor = .red
    //    m.layer.masksToBounds = true
        m.layer.cornerRadius = 5
        return m
    }()
    
    let userText: UITextField = {
        let u = UITextField()
     //   u.backgroundColor = .clear
        u.placeholder = ""
        u.layer.cornerRadius = 5
        u.font = UIFont(name: "AbrilFatface-Regular", size: 30)
        u.adjustsFontForContentSizeCategory = true
        u.adjustsFontSizeToFitWidth = true
        u.layer.shadowColor = UIColor.black.cgColor
        u.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        u.layer.shadowRadius = 2
        u.layer.shadowOpacity = 1
        u.textAlignment = NSTextAlignment.center
        u.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        u.textColor = .black
        u.translatesAutoresizingMaskIntoConstraints = false
        
        return u
    }()
    
    let userBack: UIImageView = {
        let u = UIImageView()
        let image = UIImage(named:"Rectangle12")
        u.image = image
        u.layer.masksToBounds = true
        u.translatesAutoresizingMaskIntoConstraints = false
        return u
    }()
    
    
    
    override func layoutSubviews() {
        addSubview(mainView)
        addSubview(userText)
        addSubview(userBack)
        sendSubview(toBack: userBack)
        sendSubview(toBack: mainView)
        
        mainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        userText.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        userText.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        userText.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        userText.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        
        userBack.topAnchor.constraint(equalTo: userText.topAnchor).isActive = true
        userBack.bottomAnchor.constraint(equalTo: userText.bottomAnchor).isActive = true
        userBack.rightAnchor.constraint(equalTo: userText.rightAnchor).isActive = true
        userBack.leftAnchor.constraint(equalTo: userText.leftAnchor).isActive = true

      
        
    }
    
   
}
