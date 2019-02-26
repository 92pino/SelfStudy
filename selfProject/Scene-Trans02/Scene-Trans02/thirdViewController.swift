//
//  thirdViewController.swift
//  Scene-Trans02
//
//  Created by JinBae Jeong on 26/02/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func back (_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func back2(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
