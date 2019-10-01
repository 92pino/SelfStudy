//
//  InsetTextField.swift
//  BreakPoint
//
//  Created by JinBae Jeong on 2019/10/01.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [.foregroundColor: UIColor.white.cgColor])
        
        self.attributedPlaceholder = placeholder
        
        super.awakeFromNib()
    }
    
    // 기본 패딩값
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // 글 쓸때 패딩값
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // placeholder 패딩값
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
