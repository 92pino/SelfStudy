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
  let moreView = UIView()
  let moreBtn = UIButton(type: .system)
  var page = 1
  
  lazy var list: [MovieVO] = {
    var datalist = [MovieVO]()
    return datalist
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    callRestApi()
  }
  
  func callRestApi(){
    let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
    let apiURI: URL! = URL(string: url)
    
    let apidata = try! Data(contentsOf: apiURI)
    
    let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
    NSLog("API Result=\( log )")
    
    do {
      let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
      
      // ⑤ 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
      let hoppin = apiDictionary["hoppin"] as! NSDictionary
      let movies = hoppin["movies"] as! NSDictionary
      let movie = movies["movie"] as! NSArray
      
//      print(NSDictionary.self)
      
      for row in movie {
        let r = row as! NSDictionary
        let mvo = MovieVO()
        
        mvo.title = r["title"] as? String
        mvo.description = r["genreNames"] as? String
        mvo.thumbnail = r["thumbnailImage"] as? String
        mvo.detail = r["linkUrl"] as? String
        mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
        
        self.list.append(mvo)
        self.tableView.reloadData()
        
        let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
        if (self.list.count >= totalCount) {
          self.moreBtn.isHidden = true
        }
      }
    } catch {}
  }
  
  func configure(){
    title = "영화정보"
    
    view.addSubview(tableView)
    view.addSubview(moreView)
    moreView.addSubview(moreBtn)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "ListCell")
    
    moreBtn.setTitle("더보기", for: .normal)
    moreBtn.addTarget(self, action: #selector(more(_:)), for: .touchUpInside)
    
    autoLayout()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
  }
  
  @objc func more(_ sender: Any){
    self.page += 1
    self.callRestApi()
    self.tableView.reloadData()
  }
  
  func autoLayout(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = 80
    
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    moreView.translatesAutoresizingMaskIntoConstraints = false
    moreView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    moreView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    moreView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    moreView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    moreView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
    
    moreBtn.translatesAutoresizingMaskIntoConstraints = false
    moreBtn.centerXAnchor.constraint(equalTo: moreView.centerXAnchor).isActive = true
    moreBtn.topAnchor.constraint(equalTo: moreView.topAnchor).isActive = true
    moreBtn.bottomAnchor.constraint(equalTo: moreView.bottomAnchor).isActive = true
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
    
    let row = self.list[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! CustomTableViewCell
    print(list[indexPath.row].title!)
    cell.title.text = list[indexPath.row].title!
    cell.desc.text = list[indexPath.row].description!
//    cell.opendate.text = list[indexPath.row].opendate!
    cell.rating.text = String(list[indexPath.row].rating!)
//    cell.thumbnail.image = UIImage(named: list[indexPath.row].thumbnail!)
    
    let url: URL! = URL(string: row.thumbnail!)
    let imageData = try! Data(contentsOf: url)
    cell.thumbnail.image = UIImage(data:imageData)
    
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
  
  
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
  }
}
