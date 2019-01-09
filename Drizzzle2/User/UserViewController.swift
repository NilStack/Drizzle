//
//  UserViewController.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/29/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class UserViewController: UIViewController {
    fileprivate let viewModel: UserViewModel
    
    fileprivate let headerView: UserHeaderView
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.headerView = UserHeaderView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //headerView.avatarImageView.kf.setImage(with: viewModel.)
        //headerView.nameLabel.rx

    }
}
