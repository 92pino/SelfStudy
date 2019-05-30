//
//  CompleteViewController.swift
//  FirebaseLogin
//
//  Created by JinBae Jeong on 29/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    let finishLabel: UILabel = {
        let label = UILabel()
        label.text = "finish"
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        view.addSubview(finishLabel)
        finishLabel.translatesAutoresizingMaskIntoConstraints = false
        finishLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        finishLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finishLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
