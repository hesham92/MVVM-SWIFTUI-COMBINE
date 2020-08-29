//
//  PostsRouter.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 13/08/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//


import Foundation

enum PostsEndPoints: BaseEndPointProtocol {
    case posts
    case postDetails(postID: Int)
    
    var method: HTTPMethod {
        switch self {
        case .posts, .postDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .posts:
            return "posts"
        case .postDetails(let postID):
            return "posts/\(postID)"
        }
    }
}
