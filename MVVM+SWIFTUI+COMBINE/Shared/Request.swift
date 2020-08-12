//
//  Request.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Alamofire

protocol Request: URLRequestConvertible {
    var method: HTTPMethod { get  }
    var path: String { get  }
}

extension Request {
    var baseURL: URL {
        return URL(string: Environment().baseURL)!
    }
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
