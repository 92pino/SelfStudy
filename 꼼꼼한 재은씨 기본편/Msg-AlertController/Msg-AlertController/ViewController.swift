//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by JinBae Jeong on 06/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var result: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func alert(_ sender: UIButton) {
    let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요.", preferredStyle: .actionSheet)
    let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
      self.result.text = "취소 버튼을 클릭했습니다."
    }
    let ok = UIAlertAction(title: "확인", style: .default) { (_) in
      self.result.text = "확인 버튼을 클릭했습니다."
    }
    let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in
      self.result.text = "실행 버튼을 클릭했습니다."
    }
    let stop = UIAlertAction(title: "중지", style: .default) { (_) in
      self.result.text = "중지 버튼을 클릭했습니다."
    }
    
    alert.addAction(cancel)
    alert.addAction(ok)
    alert.addAction(exec)
    alert.addAction(stop)
    
    
    self.present(alert, animated: true)
  }
  
  @IBAction func login(_ sender: UIButton) {
    let title = "iTunes Store에 로그인"
    let message = "사용자의 Apple ID 92pino@gmail.com의 암호를 입력하세요"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    let ok = UIAlertAction(title: "확인", style: .default) { (_) in
      if let tf = alert.textFields?[0] {
        print("입력된 값은 \(tf.text!)입니다.")
      } else {
        print("입력된 값이 없습니다.")
      }
    }
    
    alert.addAction(cancel)
    alert.addAction(ok)
    
    alert.addTextField { (tf) in
      tf.placeholder = "암호"
      tf.isSecureTextEntry = true
    }
    
    self.present(alert, animated: true)
  }
  
  @IBAction func auth(_ sender: Any) {
    let msg = "로그인"
    let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    let ok = UIAlertAction(title: "확인", style: .default) { (_) in
      let loginId = alert.textFields?[0].text
      let loginPw = alert.textFields?[1].text
      
      if loginId == "92pino" && loginPw == "1234" {
        self.result.text = "인증되었습니다."
      } else {
        self.result.text = "인증에 실패하였습니다"
      }
    }
    
    alert.addTextField {
      $0.placeholder = "아이디"
      $0.isSecureTextEntry = false
    }
    
    alert.addTextField {
      $0.placeholder = "비밀번호"
      $0.isSecureTextEntry = true
    }
    
    alert.addAction(cancel)
    alert.addAction(ok)
    
    self.present(alert, animated: true)
  }
  
  
}

