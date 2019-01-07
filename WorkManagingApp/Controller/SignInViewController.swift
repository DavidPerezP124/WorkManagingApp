//
//  SignInViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 5/1/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController,  UITextFieldDelegate {

  
    let viewBackground: UIImageView = {
        let v = UIImageView(image: UIImage(named: "firstWindowsBack"))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let scrollView: UIScrollView = {
       let s = UIScrollView()
        s.backgroundColor = .clear
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let backB : UIButton = {
        let b = UIButton(type: UIButtonType.system)
        let image = UIImage(named:"backButton")
        b.setImage(image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: UIControlState.normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(presentPreviousView), for: .touchUpInside)
        return b
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
        l.addTarget(self, action: #selector(segueToManaWork), for: UIControlEvents.touchUpInside)
        return l
    }()
    
    let mailTextView: textFieldView = {
        let n = textFieldView()
       let m = n.userText

        m.placeholder = "enter mail"
       
       
        m.translatesAutoresizingMaskIntoConstraints = false
        return n
    }()
    
  
    
    
    let passwordTextView: textFieldView = {
        let m = textFieldView()
        m.userText.placeholder = "password"
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
  
    func setupView(){
        
        let view10 = view.frame.height*0.06
        stackView.spacing = view10
        view.addSubview(viewBackground)
        view.addSubview(backB)
        view.addSubview(scrollView)
         scrollView.addSubview(stackView)
        stackView.addArrangedSubview(mailTextView)
        stackView.addArrangedSubview(passwordTextView)
        mailTextView.userText.delegate = self
        passwordTextView.userText.delegate = self
        
      //  view.bringSubview(toFront: stackView)
        viewBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewBackground.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewBackground.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        
        // stackView.arrangedSubviews[mailTextView, userNameTextView, passwordTextView, repeatPassTextView]
        
        
        view.addSubview(submitButton)
        
        backB.topAnchor.constraint(equalTo: view.topAnchor, constant: view10).isActive = true
        backB.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view10).isActive  = true
        backB.heightAnchor.constraint(equalToConstant: view10).isActive = true
        backB.widthAnchor.constraint(equalToConstant: view10).isActive  = true
        
        scrollView.topAnchor.constraint(equalTo: backB.bottomAnchor, constant: view10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,  constant: -(view.frame.height/3)).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width*0.1).isActive = true
        
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        
        mailTextView.heightAnchor.constraint(equalToConstant: view10).isActive = true
        mailTextView.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
       // mailTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mailTextView.topAnchor.constraint(equalTo: stackView.topAnchor,  constant: view10).isActive = true
        
      
        passwordTextView.heightAnchor.constraint(equalTo: mailTextView.heightAnchor).isActive = true
        passwordTextView.widthAnchor.constraint(equalTo: mailTextView.widthAnchor).isActive = true
        passwordTextView.topAnchor.constraint(equalTo: mailTextView.bottomAnchor, constant: 50).isActive =  true
        
        submitButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: view10).isActive = true
        submitButton.heightAnchor.constraint(equalTo: mailTextView.heightAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view10)).isActive = true
        
        
       
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        scrollView.setContentOffset(CGPoint(x:0 , y: 25), animated: true )
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
        if textField == mailTextView.userText || textField == passwordTextView.userText {
            textField.resignFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0 , y: 0), animated: true)
        }
        return true
    }
    
    
    
    @objc
    
    func presentPreviousView(){
        present(WelcomeScreenViewController(), animated: true, completion: nil)
    }
    @objc
    func segueToManaWork(){
        
        
        
        if mailTextView.userText.text != nil && passwordTextView.userText.text != nil {
            Auth.auth().signIn(withEmail: mailTextView.userText.text!, password: passwordTextView.userText.text!, completion: { (user, error) in
                if error != nil {
                    print(error)
                }else{
                    print("signed in with user: \(String(describing: user))")
                    self.present(ViewController(), animated: true, completion: nil)

                }
            })
            
        
            
            if let user = Auth.auth().currentUser {
                self.present(ViewController(), animated: true, completion: nil)
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
