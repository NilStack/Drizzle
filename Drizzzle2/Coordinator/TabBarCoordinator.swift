//
//  TabBarCoordinator.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/25/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    //let userViewController: UserViewController
    let userViewController: UIViewController

    init(with tabBarController: UITabBarController) {
        //userViewController = UserViewController()
        userViewController = UIViewController()

        let attrsNormal = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19.0)
        ]
        let attrsSelected = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19.0)
        ]
        UITabBarItem.appearance()
                    .setTitleTextAttributes(attrsNormal, for: .normal)
        UITabBarItem.appearance()
                    .setTitleTextAttributes(attrsSelected, for: .selected)

        let userTabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)
        userViewController.tabBarItem = userTabBarItem
        tabBarController.viewControllers = [userViewController]
    }

    func start() {
        print("tab bar start")
    }
}
