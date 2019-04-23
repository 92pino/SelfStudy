//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by JinBae Jeong on 23/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class NewSegue: UIStoryboardSegue {
    // UIStoryboardSegue 클래스에서 세그웨이의 실행을 처리하는 메소드는 perform
    override func perform() {
        // 세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.source
        // 세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        // fromView에서 toView로 뷰를 전환
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
