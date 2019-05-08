//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 08/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  let tableView = UITableView()
  
  var dataset = [
    ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
    ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
    ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 7.31, "secret.jpg")
  ]
  
  lazy var list: [MovieVO] = {
    var datalist = [MovieVO]()
    for (title, desc, opendate, rating, thumbnail) in self.dataset {
      let mvo = MovieVO()
      mvo.title = title
      mvo.description = desc
      mvo.opendate = opendate
      mvo.rating = rating
      mvo.thumbnail = thumbnail
      
      datalist.append(mvo)
    }
    return datalist
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  func configure(){
    title = "영화정보"
    
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "ListCell")
    
    autoLayout()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
  }
  
  func autoLayout(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = 80
    
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  /*
  @objc func add(_ sender: Any) {
    let alert = UIAlertController(title: "내용 입력", message: "추가될 내용을 작성해주세요", preferredStyle: .alert)
    
    alert.addTextField { (tf) in
      tf.placeholder = "내용을 입력해주세요"
    }
    
    let ok = UIAlertAction(title: "OK", style: .default) { (_) in
      if let addTitle = alert.textFields?[0].text {
        self.list.append(MovieVO().title)
        self.tableView.reloadData()
      }
    }
  }
 */
  
}

extension ListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! CustomTableViewCell
    print(list[indexPath.row].title!)
    cell.title.text = list[indexPath.row].title!
    cell.desc.text = list[indexPath.row].description!
    cell.opendate.text = list[indexPath.row].opendate!
    cell.rating.text = String(list[indexPath.row].rating!)
    cell.thumbnail.image = UIImage(named: list[indexPath.row].thumbnail!)
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
  
  
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
  }
}
