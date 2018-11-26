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
    func isLoggedIn() -> Bool
}

class AuthViewModel: AuthViewModelType {
    
    let realm = try! Realm()
    let authService: AuthService = AuthService()

    /*
    init() {
        self.authService = AuthService()
    }
    */

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
    func authService(_ service: AuthService, didLoggedIn accessToken: AccessToken, completionHandler: @escaping (AccessToken) -> Void) {
        try! realm.write() {
            realm.add(accessToken, update: true)
        }
    }
    
    func authService(_ service: AuthService, didCompleteWithError error: Error?) {
        print(error.debugDescription)
    }
    
}
