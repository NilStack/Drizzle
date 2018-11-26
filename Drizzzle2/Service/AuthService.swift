//
//  AuthService.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/25/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import p2_OAuth2
import RealmSwift

///
protocol AuthServiceDelegate: class{
    //func authService(_ service: AuthService, didLoggedIn accessToken: AccessToken)
    func authService(_ service: AuthService, didLoggedIn accessToken: AccessToken, completionHandler: @escaping (AccessToken)-> Void)
    func authService(_ service: AuthService, didCompleteWithError error: Error?)
}

///
class AuthService: Service {
    
    weak var delegate: AuthServiceDelegate?
    
    var oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "",
        "client_secret": "",
        "authorize_uri": "https://dribbble.com/oauth/authorize",
        "token_uri": "https://dribbble.com/oauth/token",
        "redirect_uris": ["drizzzle://oauth/callback"],
        "scope": "public write comment upload",
        "keychain": false
        ] as OAuth2JSON)
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleRedirect(withNotification:)), name: NSNotification.Name(rawValue: Constants.Notification.DidRedirectNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleRedirect(withNotification notification: Notification) {
        if let redirectURL = notification.userInfo?["RedirectURL"] as? URL {
            oauth2.handleRedirectURL(redirectURL)
        }
    }
    
    func login() {
        print("login")
        
        if oauth2.isAuthorizing {
            oauth2.abortAuthorization()
            return
        }
        
        oauth2.authConfig.authorizeEmbedded = true
        oauth2.authConfig.authorizeContext = self
        oauth2.logger = OAuth2DebugLogger(.trace)
        oauth2.authorize { (tokenDict, error) in
            
            if let error = error {
                self.delegate?.authService(self, didCompleteWithError: error)
                return
            }
            
            if let dict = tokenDict {
                let accessToken = AccessToken()
                accessToken.accessToken = dict["access_token"] as! String
                accessToken.tokenType = dict["token_type"] as! String
                accessToken.scope = dict["scope"] as! List<String> //(dict["scope"] as! String).components(separatedBy: " ")
                //print("access token: \(dict["access_token"])")
                
                //self.delegate?.authService(self, didLoggedIn: accessToken, completionHandler: <#T##(AccessToken) -> Void#>)
            }
            
        }
    }
    
}
