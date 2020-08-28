//
//  APIClient.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//


import Foundation
import Combine
import Alamofire

class AlamofireClient: APIClientProtocol {
   func getData<T: Decodable>(request: URLRequestConvertible) -> AnyPublisher<T, APIError> {
        AF.request(request)
            .publishDecodable(type: T.self)
            .value()
            .mapError(APIError.init(error:))
            .eraseToAnyPublisher()
    }
}

extension APIError {
    init(error: AFError) {
        if error.isInvalidURLError {
            self = .invalidURL
        } else {
            self = .unkownError(error)
        }
    }
}

