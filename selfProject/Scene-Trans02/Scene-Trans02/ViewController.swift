//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by JinBae Jeong on 26/02/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        
        // 두번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        // 화면을 전환한다.
        self.navigationController?.pushViewController(uvc, animated: true)
        
    }
    
    @IBAction func moveNxt(_ sender: Any) {
        guard let uvc2 = self.storyboard?.instantiateViewController(withIdentifier: "nextVC") else {
            return
        }
        
        uvc2.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc2, animated: true)
        
    }
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.present(uvc, animated: true)
    }
    
}

