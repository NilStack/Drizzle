//
//  AuthenticationPlugin.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/28/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import Moya
import RealmSwift

struct AuthenticationPlugin: PluginType {
    // swiftlint:disable:next force_try
    let realm = try! Realm()

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request

        if let accessToken = realm.objects(AccessToken.self).first, accessToken.accessToken != "" {
            request.addValue("token \(accessToken.accessToken)", forHTTPHeaderField: "Authorization")
        } else {
            print("need auth")
        }
        return request
    }
}
