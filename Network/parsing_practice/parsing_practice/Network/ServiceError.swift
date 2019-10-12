//
//  ServiceError.swift
//  parsing_practice
//
//  Created by JinBae Jeong on 2019/10/13.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case noData
    case clientError
    case invalidStatusCode
    case invalidFormat
}
