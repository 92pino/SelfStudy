//
//  View2Controller.swift
//  snapKitExample
//
//  Created by JinBae Jeong on 2019/08/24.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class View2Controller: UIViewController {
/*:
     red는 top과 left에 맞닿아 있고 가로, 세로는 전체의 50%
     blue는 top과 right에 맞닿아 있고 가로,세로는 전체의 50%
     black는 bottom과 left에 맞닿아 있고, 가로, 세로는 전체의 50%
     green는 bottom과 right에 맞닿아 있고 가로,세로는 전체의 50%
*/
    
    var didSetupConstraints = false
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initUI()
    }
    
    static func instance() -> View2Controller {
        let vc = View2Controller()
        
        return vc
    }
    
}

extension View2Controller {
    
    func initUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(greenView)
        self.view.addSubview(blackView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if(!didSetupConstraints) {
            let multipler = 1.0 / 2.0
            
            redView.snp.makeConstraints { make in
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.top.equalTo(self.view)
                make.left.equalTo(self.view)
            }
            
            blueView.snp.makeConstraints { make in
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.top.equalTo(self.view)
                make.right.equalTo(self.view)
            }
            
            blackView.snp.makeConstraints { (make) in
                make.width.equalTo(self.view).multipliedBy(multipler)
                make.height.equalTo(self.view).multipliedBy(multipler)
                make.bottom.equalTo(self.view)
                make.left.equalTo(self.view)
            }
            
            greenView.snp.makeConstraints {
                $0.width.equalTo(self.view).multipliedBy(multipler)
                $0.height.equalTo(self.view).multipliedBy(multipler)
                $0.bottom.equalTo(self.view)
                $0.right.equalTo(self.view)
            }
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
