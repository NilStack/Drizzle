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
    fileprivate let viewModel: AuthenticationViewModelType

    init(viewModel: AuthenticationViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 30.0
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
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-100)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
    }

    // MARK: Handler

    @objc func login(sender: UIButton) {
       viewModel.login()
    }
}
