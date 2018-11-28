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
protocol AuthenticationServiceDelegate: class {
    //func authService(_ service: AuthService, didLoggedIn accessToken: AccessToken)
    typealias CompletionHandler = (AccessToken) -> Void
    func authenticationService(_ service: AuthenticationService, didLoggedIn accessToken: AccessToken)
    func authenticationService(_ service: AuthenticationService, didCompleteWithError error: Error?)
}

///
class AuthenticationService: Service {
    weak var delegate: AuthenticationServiceDelegate?

    var oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "403191816bb121987aa69aa078a628c8a96ed7d98bf7de2701f5e4b4391113eb",
        "client_secret": "1c4b276f43663b3102b8ff46d84be97567f6337777681808ae33e385696267c8",
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

        /// WARNING: try to use embeded browser controller to show authentication web page
        if let delegate = UIApplication.shared.delegate,
           let window = delegate.window,
           let rootNavigationController = window?.rootViewController as? UINavigationController,
           let authenticationViewController = rootNavigationController.viewControllers.first {
            oauth2.authConfig.authorizeEmbedded = true
            oauth2.authConfig.authorizeContext = authenticationViewController
        }
        oauth2.logger = OAuth2DebugLogger(.trace)
        oauth2.authorize { (tokenDict, error) in

            if let error = error {
                self.delegate?.authenticationService(self, didCompleteWithError: error)
                return
            }

            if let dict = tokenDict {
                let accessToken = AccessToken()
                // swiftlint:disable:next force_cast
                accessToken.accessToken = dict["access_token"] as! String
                // swiftlint:disable:next force_cast
                accessToken.tokenType = dict["token_type"] as! String
                // swiftlint:disable:next force_cast
                let scopeArray = (dict["scope"] as! String).components(separatedBy: " ")
                accessToken.scope.append(objectsIn: scopeArray)
                //print("access token: \(dict["access_token"])")
                self.delegate?.authenticationService(self, didLoggedIn: accessToken)
            }
        }
    }
}
