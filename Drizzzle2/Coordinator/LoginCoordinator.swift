//
//  LoginCoordinator.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/23/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    //let authService: AuthService
    let authViewModel: AuthViewModelType
    
    let navigationController: UINavigationController
    let loginViewController: LoginViewController
    
    init(with navigationController: UINavigationController) {
        authViewModel = AuthViewModel()
        loginViewController = LoginViewController(viewModel: authViewModel)
        
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(loginViewController, animated: true)
    }

}
