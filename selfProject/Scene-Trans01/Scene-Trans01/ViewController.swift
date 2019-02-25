//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 26/02/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    @IBAction func moveNext(_ sender: Any) {
//        // 이동할 뷰 컨트롤러 객체를 Storyboard ID 정보를 이용하여 참조
//        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
//
//        // 화면 전환할 떄의 애니메이션 타입
//        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        /*
//
//            UIModalTransitionStyle == 어떤 스타일을 적용해서 전환할 것인지
//
//            1. coverVertical : 아래에서 위로 올라가면서 전환
//            2. crossDissolve : 두 화면이 서로 교차하면서 전환
//            3. flipHorizontal : 화면 중앙 가상의 축을 기준으로 화면이 돌아가는 효과
//            4. partialCurl : 오른쪽 아래 모서리에서 시작해 페이지가 말려 올라가는 효과
//
//        */
//
//        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
//        /*
//
//            present(<새로운 뷰컨트롤러 인스턴스>, animated: <애니메이션 여뷰>)
//
//        */
//        self.present(uvc, animated: true)
//    }
    
    @IBAction func moveNext(_ sender: Any) {
        // self.storyboard!는 옵셔널이므로 nil 검사 필요
        /*
 
            if let uvc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
                uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
         
                self.present(uvc, animated: true)
            }
     
         */
        
        // if 문 대신 guard
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
    }
}

