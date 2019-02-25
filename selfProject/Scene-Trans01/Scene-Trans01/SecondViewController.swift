//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 26/02/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBAction func back(_ sender: Any) {
        
        /*
            이전 화면으로 복귀할 때에는
            dismiss(animated:) || dismiss(animated: completion:)
         
        */
        self.presentingViewController?.dismiss(animated: true)
    }
}
