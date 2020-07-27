//
//  Router.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case posts
    case postDetails(postID: Int)
    
    var baseURL: URL {
        return URL(string: Environment().baseURL)!
    }
    
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
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
}
