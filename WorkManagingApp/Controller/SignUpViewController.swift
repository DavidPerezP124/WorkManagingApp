//
//  SignUpViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/7/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuthUI

class SignUpViewController: UIViewController {
    
    var db: Firestore!
    
    let backB : UIButton = {
        let b = UIButton(type: UIButtonType.system)
        let image = UIImage(named:"backButton")
        b.setImage(image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: UIControlState.normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(presentPreviousView), for: .touchUpInside)
        return b
    }()
    
    let mailTextView: textFieldView = {
        let m = textFieldView()
        m.userText.placeholder = "enter mail"
        m.userText.returnKeyType = UIReturnKeyType.next
        m.translatesAutoresizingMaskIntoConstraints = false
        return m
    }()
    
    let userNameTextView: textFieldView = {
        let m = textFieldView()
        m.userText.placeholder = "user name"
        m.translatesAutoresizingMaskIntoConstraints = false
        return m
    }()
    
    let passwordTextView: textFieldView = {
        let m = textFieldView()
        m.userText.placeholder = "password"
        m.userText.isSecureTextEntry = true
        m.translatesAutoresizingMaskIntoConstraints = false
        return m
    }()
    
    let repeatPassTextView: textFieldView = {
        let m = textFieldView()
        m.userText.placeholder = "repeat password"
        m.userText.isSecureTextEntry = true
        m.translatesAutoresizingMaskIntoConstraints = false
        return m
    }()
    
    let stackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .equalSpacing
        s.alignment = .center
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let submitButton: UIButton = {
        let l = UIButton(type: UIButtonType.system)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        l.titleLabel?.textAlignment = NSTextAlignment.center
        l.titleLabel?.topAnchor.constraint(equalTo: l.topAnchor).isActive = true
        l.setTitle(" Submit ", for: .normal)
        l.layer.cornerRadius = 5
        l.titleLabel?.font = UIFont(name: "AbrilFatface-Regular", size: 30)
        l.setTitleColor(.white, for: .normal)
        l.setTitleShadowColor(UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.40), for: .normal)
        l.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 4.0)
        l.layer.masksToBounds = false
        l.addTarget(self, action: #selector(segueToSignIn), for: UIControlEvents.touchUpInside)
        return l
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        db = Firestore.firestore()
        setupView()
    }
    
    func setupView(){
        
        let view10 = view.frame.height*0.06
        
        view.addSubview(backB)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(mailTextView)
        stackView.addArrangedSubview(userNameTextView)
        stackView.addArrangedSubview(passwordTextView)
        stackView.addArrangedSubview(repeatPassTextView)
        
        view.addSubview(submitButton)
        
        backB.topAnchor.constraint(equalTo: view.topAnchor, constant: view10).isActive = true
        backB.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view10).isActive  = true
        backB.heightAnchor.constraint(equalToConstant: view10).isActive = true
        backB.widthAnchor.constraint(equalToConstant: view10).isActive  = true
        
        
        stackView.topAnchor.constraint(equalTo: backB.bottomAnchor, constant: view10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height*0.3)).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view10)).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view10).isActive = true
        
        mailTextView.heightAnchor.constraint(equalToConstant: view10).isActive = true
        mailTextView.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        
        userNameTextView.heightAnchor.constraint(equalTo: mailTextView.heightAnchor).isActive = true
        userNameTextView.widthAnchor.constraint(equalTo: mailTextView.widthAnchor).isActive = true
        
        passwordTextView.heightAnchor.constraint(equalTo: mailTextView.heightAnchor).isActive = true
        passwordTextView.widthAnchor.constraint(equalTo: mailTextView.widthAnchor).isActive = true
        
        repeatPassTextView.heightAnchor.constraint(equalTo: mailTextView.heightAnchor).isActive = true
        repeatPassTextView.widthAnchor.constraint(equalTo: mailTextView.widthAnchor).isActive = true
        
        submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: view10).isActive = true
        submitButton.heightAnchor.constraint(equalTo: mailTextView.heightAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view10)).isActive = true
    }
    
    @objc
    
    func presentPreviousView(){
        present(WelcomeScreenViewController(), animated: true, completion: nil)
    }
    @objc
    func segueToSignIn(){
        
        if passwordTextView.userText.text == repeatPassTextView.userText.text {
            
            Auth.auth().createUser(withEmail: mailTextView.userText.text!, password: passwordTextView.userText.text!) { (user, err) in
                if err != nil {
                    print(err ?? "communiaction error")
                }else{
                    print("created user with \(String(describing: user))")
                    self.present(SignInViewController(), animated: true, completion: nil)
                }
            }

        }
        
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
