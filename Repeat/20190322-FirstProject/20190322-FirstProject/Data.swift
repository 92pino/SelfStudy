//
//  Data.swift
//  20190322-FirstProject
//
//  Created by JinBae Jeong on 2019/07/24.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

struct DataDummy {
    let title: String
    let images: [ArrayImage]
}

struct ArrayImage {
    let image: String
}

let test: [DataDummy] = [
    DataDummy(title: "1번", images: [
        ArrayImage(image: "test"),
        ArrayImage(image: "test"),
        ArrayImage(image: "test"),
        ArrayImage(image: "test"),
        ArrayImage(image: "test"),
        ArrayImage(image: "test"),
        ArrayImage(image: "test"),
        ArrayImage(image: "test")
    ]),
    
    DataDummy(title: "2번", images: [
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1"),
        ArrayImage(image: "test1")
    ]),
    
    DataDummy(title: "3번", images: [
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2"),
        ArrayImage(image: "test2")
    ]),
    
    DataDummy(title: "4번", images: [
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3"),
        ArrayImage(image: "test3")
    ]),
    
    DataDummy(title: "5번", images: [
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4"),
        ArrayImage(image: "test4")
    ]),
]
