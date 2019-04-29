//
//  NamingViewController.swift
//  SwiftStyleGuide
//
//  Created by JinBae Jeong on 29/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class NamingViewController: UIViewController {
    
    override var description: String {
        return "Naming"
    }
    
    override func viewDidLoad() {
        title = "Naming"
    }
    
}

extension NamingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        return cell
    }
    
    
}
