//
//  ViewController.swift
//  PersonalProject
//
//  Created by JinBae Jeong on 28/12/2018.
//  Copyright © 2018 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var WelcomeMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func WelcomeBtn(_ sender: Any) {
        self.WelcomeMsg.text = "로그인 하시려면 로그인 버튼을 눌러주세요"
    }
    

    @IBAction func GoToLogin(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginPage") else {
            return
        }
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        self.present(uvc, animated: true)
    }
}

