//
//  UserService.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/29/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import RealmSwift
import Moya_ObjectMapper
import RxRealm
import RxSwift

typealias CompletionHandler = (Result<User>) -> Void

// TODO: refresh??
class UserService: Service {
    // swiftlint:disable:next force_try
    let realm = try! Realm()

    func fetchMe() /* -> Observable<User> */{
        /*let myID = UserDefaults.value(forKey: Constants.UserInfo.AuthenticatedUserIDKey)
        let me = realm.objects(User.self).filter("id == \(myID)").first
        Observable.from(Object: realm.object(ofType: User.self, forPrimaryKey: myID))
        //Observable.create { obsever in}
        
        let meObservable: Observable<User>
        
        if let myID = myID, let me = realm.objects(User.self).filter("id == \(myID)").first {
            
        } else {
            
        }

        if let me = me {
            //completionHandler(Response.success(me))
            return Observable.from(object: me)
        } else {
            //fetchMeNetwork(completionHandler: completionHandler)
            var meObservable:Observable<User>

            fetchMeNetwork { response in
                switch response {
                case .success(let me):
                    UserDefaults.standard.set(me.id, forKey: Constants.UserInfo.AuthenticatedUserIDKey)
                    
                    // swiftlint:disable:next force_try
                    try! self.realm.write {
                        self.realm
                            .add(me, update: true)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            return meObservable
        }*/
    }

    // remove completionHandler to only store user to realm db
    // others only get user from realm or observe realm's change
    // TODO: handle error
    fileprivate func fetchMeNetwork(completionHandler: @escaping CompletionHandler) {
    //fileprivate func fetchMeNetwork() {
        provider.request(GitHub.me) { result in
            switch result {
            case let .success(response):
                let statusCode = response.statusCode
                if statusCode == 200 {
                    do {
                        let authUser = try response.mapObject(User.self)
                       completionHandler(Result.success(authUser))
                    } catch {}
                } else {
                    print(String(data: response.data, encoding: .utf8)!)
                    // TODO: define domain error
                    //completionHandler(Response.failure(error))
            } // if statusCode == 200
            case let .failure(error):
                print(error)
                //completionHandler(Response.failure(error))
            }
        } // provider
    }

}
