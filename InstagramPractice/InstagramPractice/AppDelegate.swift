//
//  AppDelegate.swift
//  InstagramPractice
//
//  Created by JinBae Jeong on 17/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let home = HomeViewController()
        let plus = PlusViewController()
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [home, plus]
        
        home.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:AppImageData.homeNomal), selectedImage: UIImage(named:AppImageData.homeSelected))
        plus.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:AppImageData.plus), selectedImage: UIImage(named:AppImageData.plus))
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        return true
    }


}

