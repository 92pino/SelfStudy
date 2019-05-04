//
//  ViewController.swift
//  TabBarPractice
//
//  Created by JinBae Jeong on 02/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

extension FirstViewController {
  static var textFieldNotification: Notification.Name {
    return Notification.Name("sendTextField")
  }
}

class FirstViewController: UIViewController {

  let button = UIButton(type: .system)
  let textField = UITextField()
  let notiCenter = NotificationCenter.default
  let thirdVC = ThirdViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "FirstViewController"
    
    textField.delegate = self
    configure()
    thirdVC.set()
  }
  
  func configure(){
    view.addSubview(button)
    view.addSubview(textField)
    
    button.backgroundColor = .green
    button.frame = CGRect(x: view.frame.width / 2 - 100, y: 100, width: 200, height: 80)
    button.setTitle("go To Next", for: .normal)
    button.addTarget(self, action: #selector(goToNext(_:)), for: .touchUpInside)
    
    textField.placeholder = "값을 입력하세요"
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
    textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    
  }
  
  @objc func goToNext(_ sender: UIButton) {
    navigationController?.pushViewController(thirdVC, animated: true)
  }


}


extension FirstViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    var txt = UIColor(named: textField.text!)
    notiCenter.post(name: Notification.Name("sendTextField"), object: nil, userInfo: ["txt" : txt])
    navigationController?.pushViewController(thirdVC, animated: true)
    
    return true
  }
}
