//
//  AuthViewModel.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/25/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import RealmSwift

protocol AuthViewModelType {
    func login()
}

class AuthViewModel: AuthViewModelType {
    
    let realm = try! Realm()
    let authService: AuthService

    init(with service: AuthService) {
        self.authService = service
    }
    
    func login() {
        if (isLoggedIn()) {
            return
        }
        self.authService.login()
    }
    
    func isLoggedIn() -> Bool {
        
        return false
    }

}

extension AuthViewModel: AuthServiceDelegate {
    func didLoggedIn(with accessToken: AccessToken) {
        try! realm.write() {
            realm.add(accessToken, update: true)
        }
    }
}
