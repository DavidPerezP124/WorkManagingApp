//
//  ViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 4/22/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let backGround: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "backGroundView1")
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    
    let midView: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "Group")
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let bubble: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "secondBubble")
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let bubbleSecond: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "thirdBubble")
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    
    
    let manageButton: UIButton = {
        let m = UIButton(type: UIButtonType.system)
        m.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        m.setTitle("Manage", for: .normal)
        m.layer.cornerRadius = 5
        m.titleLabel?.font = UIFont(name: "AbrilFatface-Regular", size: 70)
        m.setTitleColor(.white, for: .normal)
        m.setTitleShadowColor(UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.25), for: .normal)
        m.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 4.0)
        m.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.20).cgColor
        m.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        m.layer.shadowOpacity = 1.0
        m.layer.shadowRadius = 0.0
        m.layer.masksToBounds = false
        m.translatesAutoresizingMaskIntoConstraints = false
        m.addTarget(self, action: #selector(segueToManagerHome), for: UIControlEvents.touchUpInside)
        return m
    }()
    
    let workButton: UIButton = {
        let m = UIButton(type: UIButtonType.system)
        m.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        m.setTitle("Work", for: .normal)
        m.layer.cornerRadius = 5
        m.titleLabel?.font = UIFont(name: "AbrilFatface-Regular", size: 70)
        m.setTitleColor(.white, for: .normal)
        m.setTitleShadowColor(UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.25), for: .normal)
        m.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 4.0)
        m.reversesTitleShadowWhenHighlighted = true
        m.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.20).cgColor
        m.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        m.layer.shadowOpacity = 1.0
        m.layer.shadowRadius = 0.0
        m.layer.masksToBounds = false
        m.translatesAutoresizingMaskIntoConstraints = false
         m.addTarget(self, action: #selector(segueToWorkerView), for: UIControlEvents.touchUpInside)
        return m
    }()
    
    
    override func viewDidLoad() {
        
        
        setupView()
    }
    
    
    
    
   private func setupView(){
        view.addSubview(backGround)
        view.addSubview(midView)
        view.addSubview(bubble)
        view.addSubview(bubbleSecond)
        view.addSubview(manageButton)
        view.addSubview(workButton)
        
        
        backGround.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGround.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        
        midView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        midView.heightAnchor.constraint(equalToConstant: view.frame.width/6).isActive = true
        midView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/2.75).isActive = true
        
        
        
        bubble.widthAnchor.constraint(equalToConstant: view.frame.width/6).isActive = true
        bubble.heightAnchor.constraint(equalToConstant: view.frame.width/6).isActive = true
        bubble.bottomAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2.75)-20).isActive = true
        bubble.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width/3.25)).isActive = true
        
        bubbleSecond.widthAnchor.constraint(equalToConstant: view.frame.width/6).isActive = true
        bubbleSecond.heightAnchor.constraint(equalToConstant: view.frame.width/6).isActive = true
        bubbleSecond.bottomAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height/2.75)-90).isActive = true
        bubbleSecond.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width/2)).isActive = true
        
        manageButton.topAnchor.constraint(equalTo: midView.bottomAnchor, constant: 40).isActive = true
        manageButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        manageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
        manageButton.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        
        workButton.topAnchor.constraint(equalTo: manageButton.bottomAnchor, constant: 50).isActive = true
        workButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        workButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
        workButton.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        
        
    }
    
    @objc
    func segueToManagerHome(){
        performSegue(withIdentifier: "showManagerView", sender: self)
    }
    
    @objc
    func segueToWorkerView(){
        performSegue(withIdentifier: "showWorkerView", sender: self)
    }
    
}


