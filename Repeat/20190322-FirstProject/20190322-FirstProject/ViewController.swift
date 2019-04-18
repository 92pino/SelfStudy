//
//  ViewController.swift
//  20190322-FirstProject
//
//  Created by JinBae Jeong on 19/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

/***********************************************************************
 
 open : 외부 모듈에서 자기 자신을 바라보고 사용할수 있도록 하는것 (오버라이드해서 변형 가능하도록)
 public : open과 동일하나 그대로 사용해라
 
 view는 UIViewController 내부에 open var view: UIView! 로 내장되어있다.
 
 ***********************************************************************/

import UIKit

class ViewController: UIViewController {

    let orangeView = UIView()
    let label = UILabel()
    let button = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    let button3 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // self란 viewController 자기 자신을 의미 (생략 가능)
        // UIColor타입인데 UIColor가 생략됨 (enum)
        
        // 스토리보드에서 backgroundColor를 지정해도 viewDidLoad에서 지정한 backgroundColor가 우선적으로 실행
        self.view.backgroundColor = UIColor.yellow
        
        orangeView.frame = CGRect(x: 30, y: 150, width: view.frame.width - 60, height: 300)
        orangeView.backgroundColor = .orange
        
        label.frame = CGRect(x: 30, y: 500, width: view.frame.width - 60, height: 50)
        label.text = "Hello, world"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        button.setTitle("Action", for: .normal)
        button.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
        
        button2.setTitle("Button2", for: .normal)
        button2.frame = CGRect(x: 10, y: 70, width: 100, height: 30)
        button2.setTitleColor(.black, for: .normal)
        button2.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
        
        view.addSubview(orangeView)
        view.addSubview(label)
        orangeView.addSubview(button)
        orangeView.addSubview(button2)
        
    }
    
    // sender란? 어떤 객체가 이벤트를 발생시켜서 넘겼는지?
    @objc func buttonEvent(_ sender: UIButton){
        print("tapButton", sender)
    }


}

