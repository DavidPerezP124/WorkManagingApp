//
//  ManageTaskViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/24/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ManageTaskViewController: UIViewController, UITextFieldDelegate {
    
    
    let segueButton: UIButton = {
        let s = UIButton(type: .system)
        let image = UIImage(named: "backButton")
        s.setImage(image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        s.addTarget(self, action: #selector(segueToPreviousView), for: UIControlEvents.touchUpInside)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.backgroundColor = .clear
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let taskDescription: textFieldView = {
        let t = textFieldView()
        t.userText.placeholder = "Shortly describe the task required"
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let taskPrice: textFieldView = {
        let t = textFieldView()
        t.userText.placeholder = "Set how much you're gonna pay"
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let taskTime: textFieldView = {
        let t = textFieldView()
        t.userText.placeholder = "Set in how much time you need to have it started"
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
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
        l.addTarget(self, action: #selector(submitInformation), for: UIControlEvents.touchUpInside)
        return l
    }()
    
    let stackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .equalSpacing
        s.spacing = 30
        s.alignment = .center
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var db = Firestore.firestore()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    func setupViews(){
        
        let view10 = view.frame.height*0.1
        
        view.addSubview(segueButton)
        scrollView.addSubview(stackView)
        
        
        stackView.addArrangedSubview(taskDescription)
        stackView.addArrangedSubview(taskPrice)
        stackView.addArrangedSubview(taskTime)
        view.addSubview(scrollView)
        view.addSubview(submitButton)
        
        taskDescription.userText.delegate = self
        taskPrice.userText.delegate = self
        taskTime.userText.delegate = self
        
        segueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view10).isActive = true
        segueButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view10).isActive = true
        segueButton.heightAnchor.constraint(equalToConstant: view.frame.width/8).isActive = true
        segueButton.widthAnchor.constraint(equalToConstant: view.frame.width/8).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: segueButton.bottomAnchor, constant: view10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/5)).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width*0.1).isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        
        //        stackView.topAnchor.constraint(equalTo: segueButton.bottomAnchor, constant: view10).isActive = true
        //        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/5)).isActive = true
        //        stackView.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        //        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width*0.1).isActive = true
        
        taskDescription.heightAnchor.constraint(equalToConstant: view.frame.height*0.1).isActive = true
        taskDescription.widthAnchor.constraint(equalToConstant: view.frame.width*0.8).isActive = true
        
        taskPrice.heightAnchor.constraint(equalTo: taskDescription.heightAnchor).isActive = true
        taskPrice.widthAnchor.constraint(equalTo: taskDescription.widthAnchor).isActive = true
        
        taskTime.heightAnchor.constraint(equalTo: taskDescription.heightAnchor).isActive = true
        taskTime.widthAnchor.constraint(equalTo: taskDescription.widthAnchor).isActive = true
        
        
        submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.3).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: view.frame.height/5).isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width*0.1)).isActive = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == taskTime.userText {
        scrollView.setContentOffset(CGPoint(x:0, y: 100), animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == taskDescription.userText || textField == taskPrice.userText || textField == taskTime.userText {
            textField.resignFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0 , y: 0), animated: true)
        }
        return true
    }
    
    
    @objc
    func segueToPreviousView(){
        present(ManagerViewController(), animated: true, completion: nil)
    }
    
    @objc
    func submitInformation(){
        let user =  String(describing: Auth.auth().currentUser!.uid)
        let newWorkObject = workObject.init(jobDescription: self.taskDescription.userText.text!, jobPrice: self.taskPrice.userText.text!, jobTime: self.taskTime.userText.text!)
        
        //        let infoDictionary: [String : Any] = [
        //            "description": self.taskDescription.userText.text!,
        //            "price": self.taskPrice.userText.text!,
        //            "time":self.taskTime.userText.text!
        //        ]
        var ref: DocumentReference? = nil
        
        
        ref = Firestore.firestore().collection("user").document(user).collection("taskCollection").addDocument(data: newWorkObject.dicitionary) { (err) in
            if let err = err {
                print("Error writing document: \(err.localizedDescription)")
            } else {
                print("Document successfully written with ref: \(ref?.documentID)")
            }
        }
        
        
        //        Firestore.firestore().collection("user").document(user).setData(newWorkObject.dicitionary){ err in
        //            if let err = err {
        //                print("Error writing document: \(err)")
        //            } else {
        //                print("Document successfully written!")
        //            }
        //        }
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
