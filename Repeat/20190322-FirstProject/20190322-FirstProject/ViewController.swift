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

    let dummy = [test]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testData()
    }

    private func testData() {
        dummy.map { $0 }.flatMap { print($0) }
    }
    
}

