//
//  AuthenticationViewController.swift
//  Drizzzle
//
//  Created by 郭朋 on 25/08/2017.
//  Copyright © 2017 Peng Guo. All rights reserved.
//

import UIKit
import p2_OAuth2
import SnapKit
import RealmSwift

protocol AuthenticationViewControllerDelegate {
    
}

class AuthenticationViewController: UIViewController {
    
    //let authViewModel: AuthenticationViewModel
    //let authService: AuthService
    
    fileprivate let viewModel: AuthenticationViewModelType
    
    /*
    init(with service: AuthService) {
        self.authService = service
        super.init(nibName: nil, bundle: nil)
    }
    */
    init(viewModel: AuthenticationViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    /*
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let loginButton: LoginButton = {
        let button = LoginButton()
        button.setTitle("Login with Dribbble", for: .normal)
        button.addTarget(self, action: #selector(login(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: UI
    
    func setUpViews() {
        view.backgroundColor = .white
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(view)
            make.width.equalTo(200)//.dividedBy(3.0)
            make.height.equalTo(80)
        }
    }
    
    // MARK: Handler
    
    @objc func login(sender: UIButton) {
        print("login")
        //authService.login()
       viewModel.login()
    }

}
