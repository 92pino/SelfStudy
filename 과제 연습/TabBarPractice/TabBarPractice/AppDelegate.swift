//
//  AppDelegate.swift
//  TabBarPractice
//
//  Created by JinBae Jeong on 02/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    
    let firstVC = UINavigationController(rootViewController: FirstViewController())
    firstVC.tabBarItem = UITabBarItem(title: "첫번째", image: nil, tag: 0)
    let secondVC = SecondViewController()
    secondVC.title = "SecondViewController"
    secondVC.tabBarItem = UITabBarItem(title: "두번째", image: nil, tag: 1)
    
    let tabVC = UITabBarController()
    tabVC.setViewControllers([firstVC, secondVC], animated: true)
    
    window?.rootViewController = tabVC
    window?.makeKeyAndVisible()
    
    return true
  }

}

