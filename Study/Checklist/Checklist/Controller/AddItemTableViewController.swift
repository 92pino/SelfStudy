//
//  AViewController.swift
//  Checklist
//
//  Created by JinBae Jeong on 2019/10/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class AddItemTableViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return tableView
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(add))

        view.addSubview(tableView)
        
        configureConstraints()
    }
    
    @objc func cancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func add(_ sender: UIButton) {
        
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
