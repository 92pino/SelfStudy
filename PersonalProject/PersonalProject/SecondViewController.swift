//
//  BackToMain.swift
//  PersonalProject
//
//  Created by JinBae Jeong on 28/12/2018.
//  Copyright © 2018 pino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func BackToMain(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
