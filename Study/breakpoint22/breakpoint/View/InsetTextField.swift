//
//  InsetTextField.swift
//  breakpoint
//
//  Created by brian은석 on 01/10/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    private var textRectOffset:CGFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    }
    
   


}
