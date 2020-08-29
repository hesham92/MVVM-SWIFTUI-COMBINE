//
//  PostsRequest.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 28/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Alamofire

enum PostsRequest: Request {
    case posts
    case postDetails(postID: Int)
    
    var method: HTTPMethod {
        switch self {
        case .posts, .postDetails: return .get
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



