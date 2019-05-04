//
//  FirstViewController.swift
//  SelfProjectNavi
//
//  Created by JinBae Jeong on 29/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let firstNum = UILabel()
    let plus = UIButton(type: .system)
    let minus = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Frist View"
        // Do any additional setup after loading the view.
        
        setFrame()
    }
    
    func setFrame(){
        firstNum.text = "0"
        positionLayout()
        view.addSubview(firstNum)
    }
    
    func positionLayout(){
        firstNum.frame = CGRect(x: view.frame.width / 2 - 100, y: 100, width: 200, height: 60)
        firstNum.backgroundColor = .green
        firstNum.textAlignment = .center
        firstNum.font = UIFont.systemFont(ofSize: 30)
    }
    
}
