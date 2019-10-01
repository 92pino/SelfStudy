//
//  AuthVC.swift
//  BreakPoint
//
//  Created by JinBae Jeong on 2019/10/01.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // email 버튼 액션 이벤트
    @IBAction func signInWithEmailBtnWasPressed(_ sender: UIButton) {
        print(1111)
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    // 구글 버튼 액션 이벤트
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    
    // 페이스북 버튼 액션 이벤트
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
}
