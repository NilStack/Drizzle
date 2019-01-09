//
//  UserViewModel.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/29/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public class UserViewModel/*: ViewModel*/ {
    //let input: Input
    //let output: Output
    
    struct Input {
        let user: AnyObserver<User>
    }
    
    struct Output {
        var avatarURL: Observable<String>!
    }

    //fileprivate let user: Observable<User>
    
    init() {
        //self.input = Input(user: <#T##AnyObserver<User>#>)
        let service = UserService()
       /*
        user = Observable<User>.create({ subscriber in
            service.fetchMe(completionHandler: { response in
                switch response {
                case .success(let me):
                    subscriber.onNext(me)
                case .failure(let error):
                    print(error.localizedDescription)
                    subscriber.onError(error)
                }
            })
            return Disposables.create()
        })
 */
    }
    
    /*
    func fetchMe() {
        service.fetchMe { response in
            switch response {
            case .success(let me):
                //self.avatarURL = me.avatarURL!
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
 */

}
