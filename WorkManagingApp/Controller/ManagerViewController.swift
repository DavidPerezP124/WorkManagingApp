//
//  ManagerViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 4/26/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {
    
    
    let backgroundView: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "backgroundImageManager")
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let viewTableView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    let addTaskButton: UIButton = {
        let e = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "addTask")
        e.setBackgroundImage(image, for: .normal)
        e.layer.masksToBounds = true
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    let eraseTaskButton: UIButton = {
        let e = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "eraseButton")
        e.setBackgroundImage(image, for: .normal)
        e.clipsToBounds = true
        // e.layer.cornerRadius = 80
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    let messageButton: UIButton = {
        let e = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "messagebutton")
        e.setBackgroundImage(image, for: .normal)
        e.layer.masksToBounds = true
        e.layer.cornerRadius = 30
        e.translatesAutoresizingMaskIntoConstraints = false
        return e
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  view.backgroundColor = .red
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        
        //MARK: Adding Subviews
        view.addSubview(backgroundView)
        view.addSubview(addTaskButton)
        view.addSubview(eraseTaskButton)
        view.addSubview(messageButton)
        
        //MARK: constraints for backgroundView
        
        backgroundView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        //MARK: constraints for Add Task Button
        addTaskButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/8)).isActive = true
        addTaskButton.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        addTaskButton.heightAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        addTaskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
       
        //MARK: constraints for erase button
        eraseTaskButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/9)).isActive = true
        eraseTaskButton.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        eraseTaskButton.heightAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        eraseTaskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/2.5).isActive = true
        
        
        //MARK: constraints for message Button
        
        messageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/8)).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        messageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
