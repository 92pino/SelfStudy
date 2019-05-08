//
//  AppDelegate.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 08/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let vc = UINavigationController(rootViewController: ListViewController())
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

