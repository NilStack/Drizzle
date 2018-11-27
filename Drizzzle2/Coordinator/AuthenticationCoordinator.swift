//
//  AuthenticationCoordinator.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/23/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

protocol AuthenticationCoordinatorDelegate: class {
    func didAuthenticate(_ coordinator: AuthenticationCoordinator)
}

class AuthenticationCoordinator: Coordinator {
    let authViewModel: AuthenticationViewModel
    
    let navigationController: UINavigationController
    let authenticationViewController: AuthenticationViewController
    
    weak var delegate: AuthenticationCoordinatorDelegate?

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController

        self.authViewModel = AuthenticationViewModel()
        self.authenticationViewController = AuthenticationViewController(viewModel: authViewModel)
        self.authViewModel.delegate = self
    }
    
    func start() {
        navigationController
            .pushViewController(authenticationViewController, animated: true)
    }

}

extension AuthenticationCoordinator: AuthenticationViewModelDelegate {
    func authenticationViewModel(_ viewModel: AuthenticationViewModel, didAuthenticate: Bool, error: Error?) {
        if (didAuthenticate) {
            self.delegate?.didAuthenticate(self)
        } else if let error = error {
            print(error)
        }
    }
    
    
}
