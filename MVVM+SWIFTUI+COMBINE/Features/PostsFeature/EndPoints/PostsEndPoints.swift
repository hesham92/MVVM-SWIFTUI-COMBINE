//
//  PostsRouter.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 13/08/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//


import Foundation
import Alamofire

enum PostsEndPoints: BaseEndPointProtocol {
    case posts
    case postDetails(postID: Int)
    case login(username: String, password: String)

    var method: HTTPMethod {
        switch self {
        case .posts, .postDetails:
            return .get
        case.login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .posts:
            return "posts"
        case .postDetails(let postID):
            return "posts/\(postID)"
        case .login:
            return "login"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = baseRequest
        
        switch self {
        case let .login(username, password):
            request = try JSONParameterEncoder().encode(["uswername": username, "password": password], into: request)
        default:
            break
        }
        
        return request
    }
}
