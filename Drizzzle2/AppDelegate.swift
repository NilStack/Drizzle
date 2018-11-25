//
//  AppDelegate.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/22/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "drizzzle" {
            NotificationCenter.default.post(name: NSNotification.Name(Constants.Notification.DidRedirectNotification), object: nil, userInfo: ["RedirectURL": url])
            return true
        }
        return false
    }

}

