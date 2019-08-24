//
//  View3Controller.swift
//  snapKitExample
//
//  Created by JinBae Jeong on 2019/08/24.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class View3Controller: UIViewController {
    
    var didSetUpConstraints = false
    
    let bodyView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    static func instance() -> View3Controller {
        let vc = View3Controller()
        
        return vc
    }

}

extension View3Controller {
    
    func initUI() {
        view.backgroundColor = .white
        view.addSubview(bodyView)
        view.addSubview(footerView)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if(!didSetUpConstraints) {
            
            bodyView.snp.makeConstraints{
                $0.top.left.right.equalTo(view)
                $0.bottom.equalTo(footerView.snp.top)
            }
            
            footerView.snp.makeConstraints{
                $0.height.equalTo(100)
                $0.bottom.left.right.equalTo(view)
            }
            didSetUpConstraints = false
        }
        
        super.updateViewConstraints()
    }
    
}
