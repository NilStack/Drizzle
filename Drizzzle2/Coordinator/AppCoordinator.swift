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

    var authenticationCoordinator: AuthenticationCoordinator?
    var tabBarCoordinator: TabBarCoordinator?

    var isAuthenticated: Bool = {
        let isAuthenticated = UserDefaults.standard.bool(forKey: Constants.Autentication.AutenticationStatusKey)
        return isAuthenticated
    }()

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        if (isAuthenticated) {
            showContent()
        } else {
            showAuthentication()
        }
    }

    func showContent() {
        guard let window = window else {
            return
        }

        let tabbarController = UITabBarController()
        window.switchRootViewController(to: tabbarController)
        window.makeKeyAndVisible()

        tabBarCoordinator = TabBarCoordinator(with: tabbarController)
        // swiftlint:disable:next force_unwrapping
        tabBarCoordinator!.start()
    }

    func showAuthentication() {
        guard let window = window else {
            return
        }

        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        authenticationCoordinator = AuthenticationCoordinator(with: navigationController)
        // swiftlint:disable:next force_unwrapping
        authenticationCoordinator!.delegate = self
        authenticationCoordinator!.start()
        // swiftlint:disable:previous force_unwrapping
    }
}

extension AppCoordinator: AuthenticationCoordinatorDelegate {
    func didAuthenticate(_ coordinator: AuthenticationCoordinator) {
        isAuthenticated = true
        UserDefaults.standard.set(isAuthenticated, forKey: Constants.Autentication.AutenticationStatusKey)
        showContent()
    }
}
