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
    let authService: AuthService
    let loginCoordinator: LoginCoordinator
    let tabBarCoordinator: TabBarCoordinator
    
    init(window: UIWindow?) {
        self.window = window
        authService = AuthService()
        loginCoordinator = LoginCoordinator()
        tabBarCoordinator = TabBarCoordinator()
    }
    
    func start() {
        guard let window = window else {
            return
        }
        
        if (authService.isLoggedIn()) {
            tabBarCoordinator.start()
        } else {
            loginCoordinator.start()
        }
        
    }
    
}
