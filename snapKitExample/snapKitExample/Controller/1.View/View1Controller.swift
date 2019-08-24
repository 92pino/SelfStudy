//
//  View1Controller.swift
//  snapKitExample
//
//  Created by JinBae Jeong on 2019/08/24.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class View1Controller: UIViewController {
    
    var didSetupConstraints = false
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    static func instance() -> View1Controller {
        let vc = View1Controller()
        return vc
    }

}

extension View1Controller {
    
    func initUI() {
        view.backgroundColor = .white
        view.addSubview(redView)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            redView.snp.makeConstraints { make in
                // 가로 세로 사이즈를 100으로
                make.size.equalTo(100)
                // Superview의 센터와 동일하다
                // ==> center는 x좌표 center, y좌표 center를 의미
                // ==> redView.center == viewcontroller.center
                make.center.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
    
}
