//
//  ShadowView.swift
//  breakpoint
//
//  Created by brian은석 on 01/10/2019.
//  Copyright © 2019 brian. All rights reserved.
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
