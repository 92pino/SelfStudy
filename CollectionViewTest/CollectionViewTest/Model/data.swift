//
//  data.swift
//  CollectionViewTest
//
//  Created by JinBae Jeong on 21/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class BountyInfo {
    var name: String
    var bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
