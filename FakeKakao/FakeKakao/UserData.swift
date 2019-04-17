//
//  UserData.swift
//  FakeKakao
//
//  Created by JinBae Jeong on 17/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

final class UserModel {
    //저장된 계정 정보
    var model: [User] = [
        User(id: "admin", password: "11112222"),
        User(id: "pino", password: "abcdefg"),
        User(id: "pinkeb", password: "pinkeb")
    ]
    
    struct User {
        var id: String
        var password: String
    }
    
    //계정 정보 확인 함수
    func findUser(inputID: String, inputPassword: String) -> Bool {
        for user in model {
            if user.id == inputID && user.password == inputPassword {
                return true
            }
        }
        return false
    }
    
    //회원 추가 함수
    func addUser(newID: String, newPassword: String) {
        let newUser = User(id: newID, password: newPassword)
        model.append(newUser)
    }
}
