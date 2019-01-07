//
//  ManagerViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 4/26/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit
import FirebaseAuthUI
import FirebaseFirestore

class ManagerViewController: UIViewController {
    
    
    
    let backgroundView: UIImageView = {
        let b = UIImageView()
        b.image = UIImage(named: "firstWindowsBack")
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
    
    let tableViewController: ManagerWorkTableViewController = {
        let t = ManagerWorkTableViewController()
    t.view.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let previousViewButton: UIButton = {
        let r = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "backButton")
        r.setImage(image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: UIControlState.normal)
        r.addTarget(self, action: #selector(segueToPrevious), for: UIControlEvents.touchUpInside)
        
        r.translatesAutoresizingMaskIntoConstraints = false
        return r
    }()
    
//    let manageText: UITextView = {
//        let m = UITextView()
//        m.text = "Managed Work: "
//        m.textColor = UIColor.white
//        m.font = UIFont(name: "AbrilFatface-Regular", size: 30)
//        m.layer.shadowColor = UIColor.black.cgColor
//        m.layer.shadowRadius = 5
//        m.layer.shadowOpacity = 1
//        m.layer.shadowOffset = CGSize(width: -3.0, height: 2.0)
//        m.layer.masksToBounds = false
//        m.backgroundColor = .clear
//        m.translatesAutoresizingMaskIntoConstraints = false
//        return m
//    }()
    
    
    let addTaskButton: UIButton = {
        let e = UIButton(type: UIButtonType.system)
        let image = UIImage(named: "addTask")
        e.setBackgroundImage(image, for: .normal)
        e.layer.masksToBounds = true
        e.translatesAutoresizingMaskIntoConstraints = false
        e.addTarget(self, action: #selector(handleTaskButton), for: UIControlEvents.touchUpInside)
        return e
    }()
    
    let profileImage: UIImageView = {
        let p = UIImageView()
        p.image = UIImage(named: "profileImage")
        p.translatesAutoresizingMaskIntoConstraints = false
        return p
    }()
    
    let userInfoBackLabel: UILabel = {
        let u = UILabel()
        u.layer.masksToBounds = false
        u.translatesAutoresizingMaskIntoConstraints = false
        return u
    }()
    
    
    let jobsBackLabel: UILabel = {
        let j = UILabel()
        j.backgroundColor = UIColor.darkGray
        j.layer.masksToBounds = true
        j.translatesAutoresizingMaskIntoConstraints = false
        return j
    }()
    
    
    
    let backPanelImage: UIImageView = {
        let b = UIImageView(image: UIImage(named: "Rectangle4"))
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 5
        
        b.layer.masksToBounds = true
        return b
    }()
    
    let frontPanelImage: UIImageView = {
       let b = UIImageView(image: UIImage(named: ""))
        return b
    }()
    
    let userPanelImage: UIImageView = {
        let b = UIImageView(image: UIImage(named: "jobsBackPanel"))
       
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.masksToBounds = true
        return b
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
        let image = UIImage(named: "messageButton")
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
        
        let view24 = (view.frame.width/24)
        
        //MARK: Adding Subviews
        view.addSubview(backgroundView)
        view.addSubview(previousViewButton)
        view.addSubview(profileImage)
        view.addSubview(userInfoBackLabel)
        view.addSubview(jobsBackLabel)
        view.addSubview(addTaskButton)
        view.addSubview(eraseTaskButton)
        view.addSubview(messageButton)
        view.addSubview(tableViewController.view)
        userInfoBackLabel.addSubview(userPanelImage)
        view.addSubview(backPanelImage)
        view.bringSubview(toFront: backPanelImage)
        //MARK: constraints for backgroundView
        
        backgroundView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        //MARK: constraints for previousViewButton
        previousViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        previousViewButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        previousViewButton.widthAnchor.constraint(equalToConstant: view.frame.width/10).isActive = true
        previousViewButton.heightAnchor.constraint(equalToConstant: view.frame.width/10).isActive = true
        
        //MARK: constraints for user Image
        
        profileImage.topAnchor.constraint(equalTo: previousViewButton.bottomAnchor, constant: view.frame.height/20).isActive = true
        profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/24).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        
        //MARK: constraints for userIngoLabel
        
        userInfoBackLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        userInfoBackLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: view24).isActive = true
        userInfoBackLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view24)).isActive = true
        userInfoBackLabel.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        
        userPanelImage.topAnchor.constraint(equalTo: userInfoBackLabel.topAnchor).isActive = true
        userPanelImage.leftAnchor.constraint(equalTo: userInfoBackLabel.leftAnchor).isActive = true
        userPanelImage.rightAnchor.constraint(equalTo: userInfoBackLabel.rightAnchor).isActive = true
        userPanelImage.heightAnchor.constraint(equalTo: userInfoBackLabel.heightAnchor).isActive = true

        //MARK: constraints for jobs back label
        
        jobsBackLabel.topAnchor.constraint(equalTo: userInfoBackLabel.bottomAnchor, constant: view24).isActive = true
        jobsBackLabel.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        jobsBackLabel.leftAnchor.constraint(equalTo: profileImage.leftAnchor).isActive = true
        jobsBackLabel.rightAnchor.constraint(equalTo: userInfoBackLabel.rightAnchor).isActive = true
        
        backPanelImage.topAnchor.constraint(equalTo: jobsBackLabel.topAnchor).isActive = true
        backPanelImage.heightAnchor.constraint(equalTo: jobsBackLabel.heightAnchor).isActive = true
        backPanelImage.rightAnchor.constraint(equalTo: jobsBackLabel.rightAnchor).isActive = true
        backPanelImage.leftAnchor.constraint(equalTo: jobsBackLabel.leftAnchor).isActive = true
      
        
        //MARK: constraints for Add Task Button
        addTaskButton.topAnchor.constraint(equalTo: jobsBackLabel.bottomAnchor, constant: view24*3).isActive = true
        addTaskButton.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        addTaskButton.heightAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        addTaskButton.leftAnchor.constraint(equalTo: jobsBackLabel.leftAnchor).isActive = true
        
        //MARK: constraints for erase button
        eraseTaskButton.topAnchor.constraint(equalTo: addTaskButton.topAnchor).isActive = true
        eraseTaskButton.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        eraseTaskButton.heightAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        eraseTaskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/2.5).isActive = true
        
        
        //MARK: constraints for message Button
        messageButton.topAnchor.constraint(equalTo: addTaskButton.topAnchor).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: view.frame.width/5).isActive = true
        messageButton.rightAnchor.constraint(equalTo: jobsBackLabel.rightAnchor).isActive = true
        
        tableViewController.view.topAnchor.constraint(equalTo: jobsBackLabel.topAnchor).isActive = true
         tableViewController.view.bottomAnchor.constraint(equalTo: jobsBackLabel.bottomAnchor).isActive = true
         tableViewController.view.rightAnchor.constraint(equalTo: jobsBackLabel.rightAnchor).isActive = true
         tableViewController.view.leftAnchor.constraint(equalTo: jobsBackLabel.leftAnchor).isActive = true
        
    }
    
    @objc
    func segueToPrevious(){
        
        
        
        present(ViewController(), animated: true, completion: nil)
    }
    
    @objc
    func handleTaskButton() {
    
        present(ManageTaskViewController(), animated: true, completion: nil)
    
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
