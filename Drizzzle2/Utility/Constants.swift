//
//  Constants.swift
//  Drizzzle
//
//  Created by 郭朋 on 29/08/2017.
//  Copyright © 2017 Peng Guo. All rights reserved.
//

import UIKit

struct Constants {
    struct Notification {
        static let DidRedirectNotification = "xyz.pengguo.Dirzzzle.notification.didRedirect"
        static let DidAuthenticateNotification = "xyz.pengguo.Dirzzzle.notification.didAuthenticate"
    }

    struct Autentication {
        static let AutenticationStatusKey = "xyz.pengguo.Dirzzzle.Authentication.Status"
    }
    
    struct ProfileHeaderView {
        struct Layout {
            static let EdgeInset = 20.0
            static let InlineSpace = 20.0
            static let AvatarWidth = 50.0
            static let AvatarHeight = 50.0
            static let NameLabelHeight = 30.0
            static let LocationLabelHeight = 30.0
            static let BioLabelHeight = 60.0
        }

    }

    struct MainViewController {
        struct Layout {
            static let TabbarItemImageWidth = 25.0
            static let TabbarItemImageHeight = 25.0
        }
    }

    struct ShotsViewController {
        struct ShotCardView {
            //static let ShotImageWidth = 120.0
            //static let ShotImageHeight = 90.0
            static let BottomBarWidth = 80.0
            static let BottomBarHeight = 30.0
        }
    }
}
