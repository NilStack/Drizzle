//
//  GitHubClient.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/28/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import Moya

let provider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(verbose: true), AuthenticationPlugin()])

public enum GitHub {
    case me // authenticatedUser
    case starred
    case repositories

    //case userProfile(String)
    //case userRepositories(String)
}

extension GitHub: TargetType {
    public var baseURL: URL { return URL(string: "https://api.github.com")! }

    public var path: String {
        switch self {
        case .me:
            return "/user"
        case .starred:
            return "/user/starred"
        case .repositories:
            return "/user/repos"
        /*
        case .userProfile(let name):
            return "/users/\(name.urlEscaped)"
        case .userRepositories(let name):
            return "/users/\(name.urlEscaped)/repos"
        */
        
        }
    }

    public var method: Method {
        return .get
    }

    // TODO: move Authorization: token \(AccessToken) here
    public var headers: [String : String]? {
        return nil
    }

    public var task: Task {
        return .requestPlain
    }

    public var sampleData: Data {
        switch self {
        case .me:
            return "{}".data(using: String.Encoding.utf8)!
        case .repositories:
            return "{}".data(using: String.Encoding.utf8)!
        case .starred:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
}
