//
//  ViewController.swift
//  FlipAnimation
//
//  Created by JinBae Jeong on 23/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnCard: UIButton!
    var isOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnFlip(_ sender: Any) {
        if isOpen {
            isOpen = false
            let image = UIImage(named: "BT2-1")
            btnCard.setImage(image, for: .normal)
            UIView.transition(with: btnCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isOpen = true
            let image = UIImage(named: "BT5-3")
            btnCard.setImage(image, for: .normal)
            UIView.transition(with: btnCard, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
}

