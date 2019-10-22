//
//  TodoList.swift
//  Checklist
//
//  Created by JinBae Jeong on 2019/10/22.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

class TodoList {
    
    var todos: [ChecklistItem] = []
    
    init() {
        
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Take a jog"
        row2Item.text = "Take a jog"
        row3Item.text = "Take a jog"
        row4Item.text = "Take a jog"
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
    }
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        todos.append(item)
        return item
    }
    
    private func randomTitle() -> String {
        var titles = ["New todo item", "Generic todo", "Fill me out", "I need something todo", "Much todo about nothing"]
        let randomNumber = Int.random(in: 0 ... titles.count - 1)
        return titles[randomNumber]
    }
    
}
