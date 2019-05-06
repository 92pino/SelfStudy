//
//  ThirdViewController.swift
//  TabBarPractice
//
//  Created by JinBae Jeong on 02/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

  let notiCenter = NotificationCenter.default
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  func set(){
    notiCenter.addObserver(self, selector: #selector(changeView(sender:)), name: Notification.Name("sendTextField"), object: nil)
  }
  
  @objc func changeView(sender: Notification){
    guard let userInfo = sender.userInfo as? [String: String] else { return }
    var bgColor = userInfo["txt"]!
    switch bgColor {
    case "red":
      view.backgroundColor = .red
    case "orange":
      view.backgroundColor = .orange
    case "yellow":
      view.backgroundColor = .yellow
    case "green":
      view.backgroundColor = .green
    case "blue":
      view.backgroundColor = .blue
    default:
      view.backgroundColor = .lightGray
    }
    
    
    print("run")
  }

}
