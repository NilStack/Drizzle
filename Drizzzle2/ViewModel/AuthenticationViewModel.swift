//
//  AuthViewModel.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/25/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import RealmSwift

protocol AuthenticationViewModelType {
    func login()
}

protocol AuthenticationViewModelDelegate: class {
    func authenticationViewModel(_ viewModel: AuthenticationViewModel, didAuthenticate: Bool, error: Error?)
    
    //func authenticationViewModel(_ viewModel: AuthenticationViewModel, didCompleteWithError error: Error?)
}

class AuthenticationViewModel: AuthenticationViewModelType {
    
    let realm = try! Realm()
    let authService: AuthenticationService
    //var isLoggedIn: Bool
    weak var delegate: AuthenticationViewModelDelegate?

    init() {
        //self.isLoggedIn = false
        self.authService = AuthenticationService()
        self.authService.delegate = self
    }

    func login() {
        //if (isLoggedIn) {
        //    return
        //}
        self.authService.login()
    }

}

extension AuthenticationViewModel: AuthenticationServiceDelegate {
    func authenticationService(_ service: AuthenticationService, didLoggedIn accessToken: AccessToken/*, completionHandler: @escaping (AccessToken) -> Void*/) {
        try! realm.write() {
            realm.add(accessToken, update: true)
        }
        //isLoggedIn = true
        self.delegate?.authenticationViewModel(self, didAuthenticate: true, error: nil)
    }
    
    func authenticationService(_ service: AuthenticationService, didCompleteWithError error: Error?) {
        print(error.debugDescription)
        //isLoggedIn = false
        self.delegate?.authenticationViewModel(self, didAuthenticate: false, error: error)
    }
    
}
