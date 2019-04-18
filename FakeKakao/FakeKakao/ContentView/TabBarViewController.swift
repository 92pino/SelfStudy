//
//  TabBarViewController.swift
//  FakeKakao
//
//  Created by JinBae Jeong on 18/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let homeVC = HomeViewController()
        let settingVC = SettingViewController()
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: AppImageData.homeNomal), selectedImage: UIImage(named: AppImageData.homeSelected))
        settingVC.tabBarItem = UITabBarItem(title: "설정", image: UIImage(named: AppImageData.plus), selectedImage: UIImage(named: AppImageData.plus))
        self.viewControllers = [UINavigationController.init(rootViewController: homeVC), settingVC]
    }

}
