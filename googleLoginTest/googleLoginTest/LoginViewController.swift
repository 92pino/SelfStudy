//
//  ViewController.swift
//  googleLoginTest
//
//  Created by JinBae Jeong on 10/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {

    let googleSignInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        
        return button
    }()
    
    let signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("signOut", for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(googleSignInButton)
        view.addSubview(signOutButton)
        GIDSignIn.sharedInstance().uiDelegate = self
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            
            print("user id : ", uid)
            print("user email : ", email
            )
        }
    }
    
    private func configure() {
        googleSignInButton.addTarget(self, action: #selector(googleSignIn(_:)), for: .touchUpInside)
        signOutButton.addTarget(self, action: #selector(signOut(_:)), for: .touchUpInside)
        autoLayout()
    }
    
    private func autoLayout() {
        googleSignInButton.layout.centerX().top(equalTo: view.topAnchor, constant: 150)
        signOutButton.layout.centerX().top(equalTo: googleSignInButton.bottomAnchor, constant: 50)
    }
    
    @objc func googleSignIn(_ sender: GIDSignInButton) {
        
    }
    
    @objc func signOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            print("signOut success")
            try GIDSignIn.sharedInstance().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }


}

