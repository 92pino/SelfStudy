//
//  Model.swift
//  parsing_practice
//
//  Created by JinBae Jeong on 2019/10/13.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

/*
 
 json 구조
 
 {
     "userId" : 1,
     "id" : 1,
     "title" : "delectus aut autem",
     "completed" : false
 }
 
*/

struct Todo: Codable {
    var title: String
    var id: Int?
    var userId: Int
    var completed: Int
    
    init?(json: [String: Any]) {
        guard let title = json["title"] as? String,
            let id = json["id"] as? Int,
            let userId = json["userId"] as? Int,
            let completed = json["completed"] as? Int else {
                return nil
        }
        self.title = title
        self.userId = userId
        self.completed = completed
        self.id = id
    }
}
