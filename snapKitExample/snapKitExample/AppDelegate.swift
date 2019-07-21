//
//  AppDelegate.swift
//  snapKitExample
//
//  Created by JinBae Jeong on 2019/07/18.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let listViewController:ListViewController = ListViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: listViewController)
        
        window?.rootViewController = navigationController
        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

