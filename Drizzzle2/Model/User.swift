//
//  User.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/28/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import RealmSwift
import ObjectMapper

class User: Object, Mappable {
    @objc dynamic var authenticated = false
    @objc dynamic var login: String?
    @objc dynamic var id = -1
    @objc dynamic var avatarURL: String?
    @objc dynamic var gravatarID: String?
    @objc dynamic var type: String?
    @objc dynamic var name: String?
    @objc dynamic var company: String?
    @objc dynamic var blog: String?
    @objc dynamic var location: String?
    @objc dynamic var email: String?
    @objc dynamic var bio: String?
    @objc dynamic var numberOfPublicRepos = 0
    @objc dynamic var numberOfPublicGists = 0
    @objc dynamic var numberOfPrivateRepos = 0
    @objc dynamic var numberOfPrivateGists = 0
    @objc dynamic var numberOfFollowers = 0
    @objc dynamic var numberOfFollowing = 0

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        avatarURL <- map["avatar_url"]
        gravatarID <- map["gravatar_id"]
        type <- map["type"]
        name <- map["name"]
        company <- map["company"]
        blog <- map["blog"]
        location <- map["location"]
        email <- map["email"]
        bio <- map["bio"]
        numberOfPublicRepos <- map["public_repos"]
        numberOfPublicGists <- map["public_gists"]
        numberOfPrivateRepos <- map["total_private_repos"]
        numberOfPrivateGists <- map["private_gists"]
        numberOfFollowers <- map["followers"]
        numberOfFollowing <- map["following"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

}
