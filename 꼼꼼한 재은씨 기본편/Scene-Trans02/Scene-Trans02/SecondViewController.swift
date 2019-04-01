//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by JinBae Jeong on 01/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func movePrev(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }

    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
