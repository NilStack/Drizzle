//
//  AccessToken.swift
//  Drizzzle
//
//  Created by 郭朋 on 25/08/2017.
//  Copyright © 2017 Peng Guo. All rights reserved.
//

import UIKit
import RealmSwift

class AccessToken: Object {
    @objc dynamic var accessToken: String = ""
    @objc dynamic var tokenType: String = ""

    // https://academy.realm.io/posts/realm-list-new-superpowers-array-primitives/
    let scope: List<String> = List<String>()

    override static func primaryKey() -> String? {
        return "accessToken"
    }
}
