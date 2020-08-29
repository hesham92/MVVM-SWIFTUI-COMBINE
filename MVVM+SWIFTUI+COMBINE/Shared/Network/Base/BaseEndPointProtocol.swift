//
//  Request.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation

protocol BaseEndPointProtocol: URLRequestConvertible {
    var method: HTTPMethod { get  }
    var path: String { get  }
}

extension BaseEndPointProtocol {
    
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
