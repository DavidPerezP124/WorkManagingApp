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
        b.image = UIImage(named: "firstWindowsBack")
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
  
    
    let icon: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "Flask")
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
    
        view.addSubview(icon)
    
        view.addSubview(manageButton)
        view.addSubview(workButton)
        
        
        backGround.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGround.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        
        
        icon.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        icon.heightAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        icon.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height*0.1)).isActive = true
        icon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
        
    
        
        manageButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
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
        present(ManagerViewController(), animated: true, completion: nil)
    }
    
    @objc
    func segueToWorkerView(){
        present(WorkerViewController(), animated: true, completion: nil)
    }
    
}


