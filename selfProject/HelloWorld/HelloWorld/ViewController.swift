//
//  ViewController.swift
//  HelloWorld
//
//  Created by JinBae Jeong on 22/02/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, World!"
    }
    
}

