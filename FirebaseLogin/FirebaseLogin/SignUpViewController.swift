//
//  SignUpViewController.swift
//  FirebaseLogin
//
//  Created by JinBae Jeong on 29/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    let login: UITextField = {
        let tf = UITextField()
        tf.placeholder = "이메일을 입력해주세요"
        
        return tf
    }()
    
    let pw: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호를 입력해주세요"
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    let btn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        
        return button
    }()
    
    let finish: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Finish", for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(login)
        view.addSubview(pw)
        view.addSubview(btn)
        view.addSubview(finish)
        
        configue()
    }
    
    func configue() {
        autoLayout()
        login.borderStyle = .line
        pw.borderStyle = .line
        
        finish.addTarget(self, action: #selector(complete(_:)), for: .touchUpInside)
    }
    
    func autoLayout() {
        login.translatesAutoresizingMaskIntoConstraints = false
        login.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        login.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        login.heightAnchor.constraint(equalToConstant: 50)
        
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 30).isActive = true
        pw.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pw.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        pw.heightAnchor.constraint(equalToConstant: 50)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: pw.bottomAnchor, constant: 30).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        finish.translatesAutoresizingMaskIntoConstraints = false
        finish.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 30).isActive = true
        finish.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func complete(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: login.text!, password: pw.text!) { (user, error) in
            if let error = error {
                print("Failed to create user with error: ", error.localizedDescription)
                return
            }
            
            // success
            print("Successfully created with Firebase")
        }
        
        dismiss(animated: true)
        
    }
    
    
}

