//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 01/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
