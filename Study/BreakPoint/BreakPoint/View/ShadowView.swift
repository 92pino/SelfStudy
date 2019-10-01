//
//  ShadowView.swift
//  BreakPoint
//
//  Created by JinBae Jeong on 2019/10/01.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        
        super.awakeFromNib()
    }
    
    
    
}
