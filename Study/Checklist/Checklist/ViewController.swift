//
//  ViewController.swift
//  Checklist
//
//  Created by JinBae Jeong on 2019/10/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ChecklistItem")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    var todoList: TodoList?
    
//    required init?(coder aDecoder: NSCoder) {
//
//        super.init(coder: aDecoder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoList = TodoList()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Checklists"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "plus", style: .done, target: self, action: #selector(addItem))
        
        view.addSubview(tableView)
        configureConstraints()
    }
    
    @objc func addItem(_ sender: UIButton) {
        
        show(AddItemTableViewController(), sender: nil)
//        present(AddItemTableViewController(), animated: true, completion: nil)
        
//        let newRowIndex = todoList?.todos.count
//        _ = todoList?.newTodo()
//
//        let indexPath = IndexPath(row: newRowIndex!, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
        item.toggleChecked()
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
//            configureCheckmark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList!.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = todoList!.todos[indexPath.row]
        configureText(for: cell, with: item)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        todoList?.todos.remove(at: indexPath.row)
        
        // 자동으로 삭제할 경우 밑에 코드 2줄 추가
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        tableView.reloadData()
    }
}

