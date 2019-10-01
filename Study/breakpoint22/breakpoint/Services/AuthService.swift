//
//  AuthService.swift
//  breakpoint
//
//  Created by brian은석 on 01/10/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email:String, andPassword password: String, userCreationComplete:@escaping (_ status: Bool, _ error: Error?) -> ()) {
    
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false,error)
                return
            }
            
            let userData = ["provider": user.user.providerID, "emaill":user.user.email]
            DataService.instance.createDBUser(uid: user.user.uid, userData: userData)
            userCreationComplete(true,nil)
            
        }
    }
    func loginUser(withEmail email:String, andPassword password: String, loginComplte:@escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (dataResult, error) in
            if error != nil {
                loginComplte(false,error)
                return
            }
          
            loginComplte(true,nil)
            
            
        }
    }
}
