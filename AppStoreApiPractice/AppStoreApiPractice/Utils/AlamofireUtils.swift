//
//  AlamofireUtils.swift
//  AppStoreApiPractice
//
//  Created by JinBae Jeong on 02/07/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireUtils {
    
    let tag: String
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    init(tag: String, path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        self.tag = tag
        url = path
        self.method = method
        self.parameters = parameters
    }
    
    
}
