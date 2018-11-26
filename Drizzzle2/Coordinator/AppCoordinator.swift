//
//  AppCoordinator.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/23/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow?
    
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        guard let window = window else {
            return
        }
        
        if (isLoggedIn()) {
            let tabBarCoordinator = TabBarCoordinator()
            tabBarCoordinator.start()
        } else {
            let navigationController = UINavigationController()
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            let loginCoordinator = LoginCoordinator(with: navigationController)
            loginCoordinator.start()
        }
        
    }
    
    func isLoggedIn() -> Bool {
        return false
    }
    
}
