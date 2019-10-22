//
//  ChecklistItem.swift
//  Checklist
//
//  Created by JinBae Jeong on 2019/10/22.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
