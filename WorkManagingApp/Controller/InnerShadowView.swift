//
//  InnerShadowView.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/5/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import Foundation
import UIKit

class InnerShadowView: UIView {
    
    let shadowLayer: CALayer = {
        let s = CALayer()
        s.shadowColor = UIColor(white: 0, alpha: 1).cgColor
        s.shadowOffset = CGSize(width: 0.0,height: 0.0)
        s.shadowOpacity = 1.0
        s.shadowRadius = 4
        s.fillMode = kCAFillRuleEvenOdd
        return s
    }()
    let mainView = UIView()
    

    override func layoutSubviews() {
        let view = self.mainView
        
        shadowLayer.frame = view.bounds
        
        
    }
}
