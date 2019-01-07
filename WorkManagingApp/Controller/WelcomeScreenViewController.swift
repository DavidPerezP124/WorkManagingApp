//
//  WelcomeScreenViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/7/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class WelcomeScreenViewController: UIViewController{
    
    
    let viewBackground: UIImageView = {
       let v = UIImageView(image: UIImage(named: "firstWindowsBack"))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let logoImageView: UIImageView = {
        let l = UIImageView()
        let image = UIImage(named: "Flask")
        l.image = image 
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let signInButtonBack: UIImageView = {
        let s = UIImageView()
        let image = UIImage(named: "signInBack")
        s.image = image
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let signUpButtonBack: UIImageView = {
        let s = UIImageView()
        let image = UIImage(named: "signInBack")
        s.image = image
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    let signInButton: UIButton = {
        let l = UIButton(type: UIButtonType.system)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        l.titleLabel?.textAlignment = NSTextAlignment.center
        l.titleLabel?.topAnchor.constraint(equalTo: l.topAnchor).isActive = true
        l.setTitle(" Sign In ", for: .normal)
        l.layer.cornerRadius = 5
        l.titleLabel?.font = UIFont(name: "AbrilFatface-Regular", size: 60)
        l.setTitleColor(.white, for: .normal)
        l.setTitleShadowColor(UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.40), for: .normal)
        l.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 4.0)
        l.layer.masksToBounds = false
        l.addTarget(self, action: #selector(segueToSignIn), for: UIControlEvents.touchUpInside)
        return l
    }()
    
    let signUpButton: UIButton = {
        let l = UIButton(type: UIButtonType.system)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.titleLabel?.topAnchor.constraint(equalTo: l.topAnchor).isActive = true

        l.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        l.setTitle(" Sign up ", for: .normal)
        l.layer.cornerRadius = 5
        l.titleLabel?.font = UIFont(name: "AbrilFatface-Regular", size: 60)
        l.titleLabel?.textAlignment = NSTextAlignment.center
        l.setTitleColor(.white, for: .normal)
        l.setTitleShadowColor(UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.40), for: .normal)
        l.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 4.0)
        l.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.20).cgColor
        l.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
//        l.layer.shadowOpacity = 1.0
//        l.layer.shadowRadius = 0.0
//        l.layer.masksToBounds = false
        l.addTarget(self, action: #selector(segueToSignUp), for: UIControlEvents.touchUpInside)
        return l
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
        currentUserAlreadySignedIn()
    }
    func setupView(){
       
        view.addSubview(viewBackground)
        view.addSubview(logoImageView)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        signInButton.addSubview(signInButtonBack)
        signInButton.sendSubview(toBack: signInButtonBack)
        signUpButton.addSubview(signUpButtonBack)
        signUpButton.sendSubview(toBack: signUpButtonBack)
        
        viewBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        
        
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/5).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        
        
        signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/2).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: view.frame.height/5.5).isActive = true
        signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
        
        
        signInButtonBack.topAnchor.constraint(equalTo: signInButton.topAnchor).isActive = true
        signInButtonBack.widthAnchor.constraint(equalTo: signInButton.widthAnchor).isActive = true
        signInButtonBack.heightAnchor.constraint(equalTo: signInButton.heightAnchor).isActive = true
        signInButtonBack.rightAnchor.constraint(equalTo: signInButton.rightAnchor).isActive = true
        
        
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: signInButton.widthAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: signInButton.heightAnchor).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
        
        signUpButtonBack.topAnchor.constraint(equalTo: signUpButton.topAnchor).isActive = true
        signUpButtonBack.widthAnchor.constraint(equalTo: signUpButton.widthAnchor).isActive = true
        signUpButtonBack.heightAnchor.constraint(equalTo: signUpButton.heightAnchor).isActive = true
        signUpButtonBack.rightAnchor.constraint(equalTo: signUpButton.rightAnchor).isActive = true
        
    }
    func currentUserAlreadySignedIn(){
        
        
    }
    
    @objc
    func segueToSignUp(){
        if let user = Auth.auth().currentUser {
            self.present(ViewController(), animated: true, completion: nil)
        }else {
        present(SignUpViewController(), animated: true, completion: nil)
        }
    }
    @objc
    func segueToSignIn(){
        present(SignInViewController(), animated: true, completion: nil)
    }
    
    
}
