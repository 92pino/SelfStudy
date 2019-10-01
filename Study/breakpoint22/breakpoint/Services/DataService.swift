//
//  DataService.swift
//  breakpoint
//
//  Created by brian은석 on 26/09/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    // 왜 같은걸 굳이 두번썼을까? 계산프로퍼티로 겟만 해라!!! + oop 은닉의 성질에 의해 외부에서 보지못하게 하려고? 
    
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String,Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
