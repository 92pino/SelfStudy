//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by JinBae Jeong on 28/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    

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
    
    let signUp: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SignUp", for: .normal)
        
        return button
    }()
    
    let googleBtn: GIDSignInButton = {
        let button = GIDSignInButton()
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(login)
        view.addSubview(pw)
        view.addSubview(btn)
        view.addSubview(signUp)
        view.addSubview(googleBtn)
        
        configue()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    func configue() {
        autoLayout()
        login.borderStyle = .line
        pw.borderStyle = .line
        
        signUp.addTarget(self, action: #selector(signUp(_:)), for: .touchUpInside)
        btn.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        googleBtn.addTarget(self, action: #selector(googleLogin(_:)), for: .touchUpInside)
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
        
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 30).isActive = true
        signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        googleBtn.translatesAutoresizingMaskIntoConstraints = false
        googleBtn.topAnchor.constraint(equalTo: signUp.bottomAnchor, constant: 30).isActive = true
        googleBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func login(_ sender: UIButton) {
        let complete = CompleteViewController()
        Auth.auth().signIn(withEmail: login.text!, password: pw.text!) { (user, error) in
            if let error = error {
                print("error")
                return
            }
            self.present(complete, animated: true)
            
            
        }
    }
    
    @objc func signUp(_ sender: UIButton) {
        let signUp = SignUpViewController()
        self.present(signUp, animated: true)
    }
    
    @objc func googleLogin(_ sender: UIButton) {
        
    }
    
    


}

