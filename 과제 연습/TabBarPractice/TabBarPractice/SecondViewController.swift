//
//  SecondViewController.swift
//  TabBarPractice
//
//  Created by JinBae Jeong on 02/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  let tableView = UITableView()
  var arr = Array(1...10)
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.dataSource = self
      tableViewFunc()
    }
  
  func tableViewFunc(){
    view.addSubview(tableView)
    autoLayout()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func autoLayout(){
    let guide = view.safeAreaLayoutGuide
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
  }

}

extension SecondViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = "\(arr[indexPath.row])"
    return cell
  }
  
  
}
