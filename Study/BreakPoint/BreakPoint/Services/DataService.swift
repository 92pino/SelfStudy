//
//  DataService.swift
//  BreakPoint
//
//  Created by JinBae Jeong on 2019/09/26.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    // 같은 변수를 2번 생성한 이유
    // 같은 함수를 계속 호출하기 때문에 성능상 문제가 있을수도 있다.
    
    // private을 사용한 이유 : OOP에 은닉의 의미로 연산 프로퍼티를 사용하여 get만 해라
    
    // private(set) public var _REF_BASE = DB_BASE 로 사용해도 가능
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
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
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
