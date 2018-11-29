//
//  UserService.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/29/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import RealmSwift
import Moya_ObjectMapper

typealias CompletionHandler = (Response<User>) -> Void

class UserService: Service {
    // swiftlint:disable:next force_try
    let realm = try! Realm()

    func fetchMe(completionHandler: @escaping CompletionHandler) {
        let authUsers = realm.objects(User.self).filter("authenticated==true")
        if let authUser = authUsers.first {
            completionHandler(Response.success(authUser))
        } else {
            fetchMeNetwork(completionHandler: completionHandler)
        }
    }

    func fetchMeNetwork(completionHandler: @escaping CompletionHandler) {
        provider.request(GitHub.me) { result in
            switch result {
            case let .success(response):
                let statusCode = response.statusCode
                if statusCode == 200 {
                    do {
                        let authUser = try response.mapObject(User.self)
                        // print(user.userName)
                        authUser.authenticated = true
                        // swiftlint:disable:next force_try
                        try! self.realm.write {
                            self.realm
                                .add(authUser, update: true)
                        }
                   completionHandler(Response
                    .success(authUser))
                    } catch {}
                } else {
                    print(String(data: response.data, encoding: .utf8)!)
                    // TODO: define domain error
                    //completionHandler(Response.failure(error))
            } // if statusCode == 200
            case let .failure(error):
                print(error)
                completionHandler(Response.failure(error))
            }
        } // provider
    }

}
