//
//  ViewController.swift
//  SimpleTable
//
//  Created by JinBae Jeong on 16/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let tableView = UITableView(frame: CGRect.zero, style: .grouped)
  let button = UIButton(type: .system)
  let cellIdentifier: String = "cell"
  
  let korean: [String] = ["가","나","다","라","마","바","사", "아", "자", "차", "카", "타", "파", "하"]
  
  let english: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
  
  var dates: [Date] = []
  
  let dateFormatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .medium
    return formatter
  }()
  
  
  
  @IBAction func touchUpAddButton(_ sender: UIButton) {
    dates.append(Date())
    
    tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupTableView()
  }
  
  func setupTableView() {
    
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    view.addSubview(tableView)
    
    button.frame = tableView.frame
    button.frame = CGRect(x: 0, y: tableView.frame.height, width: tableView.frame.width, height: 100)
    button.backgroundColor = .red
    button.setTitle("Add Data", for: .normal)
    tableView.addSubview(button)
    
    button.addTarget(self, action: #selector(addData), for: .touchUpInside)

  }
  
  @objc func addData() {
    dates.append(Date())
    
    tableView.reloadData()
  }


}


extension ViewController: UITableViewDataSource {
  // 테이블뷰의 섹션에 해당하는 row의 개수가 몇개인지?
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return korean.count
    case 1:
      return english.count
    case 2:
      return dates.count
    default:
      return 0
    }
  }
  
  // row마다 해당하는 셀을 돌려달라
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
    
    if indexPath.section < 2 {
      let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
      cell.textLabel?.text = text
    } else {
      cell.textLabel?.text = dateFormatter.string(from: dates[indexPath.row])
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section < 2 {
      return section == 0 ? "한글" : "영어"
    }
    return nil
  }
  
  // 사용할 섹션의 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  
}

extension ViewController: UITableViewDelegate {
  
}
