//
//  TableView2Controller.swift
//  snapKitExample
//
//  Created by JinBae Jeong on 2019/08/24.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class TableView2Controller: UIViewController {

    var didSetupConstraints = false
    let cellName = "tableview2cell"
    
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    let dummyList: [TableView2Model] = [
        TableView2Model(name: "test1test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/101/"),
        TableView2Model(name: "test2test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/102/"),
        TableView2Model(name: "test3test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/103/"),
        TableView2Model(name: "test4test1test1test1test1test1test1test1test1test1test1test1test1test1", imageUrl: "https://lorempixel.com/100/104/"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    static func instance() -> TableView2Controller {
        let vc = TableView2Controller()
        
        return vc
    }
    
}

extension TableView2Controller {
    func initUI() {
        view.addSubview(tableView)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if(!didSetupConstraints) {
            tableView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}

extension TableView2Controller: UITableViewDelegate, UITableViewDataSource {
    public func initTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.register(TableView2Cell.self, forCellReuseIdentifier: cellName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: TableView2Cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? TableView2Cell {
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
