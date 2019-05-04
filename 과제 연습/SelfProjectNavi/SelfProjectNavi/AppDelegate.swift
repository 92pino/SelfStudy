//
//  AppDelegate.swift
//  SelfProjectNavi
//
//  Created by JinBae Jeong on 29/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupWindow()
        
        return true
    }
    
    func setupWindow(){
        let firstVC = FirstViewController()
        let naviController = UINavigationController(rootViewController: firstVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
    }


}

