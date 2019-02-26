//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by JinBae Jeong on 26/02/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
