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

class APIClient {
    func getData<T: Decodable>(request: URLRequestConvertible) -> AnyPublisher<T, APIError> {
        AF.request(request)
            .publishDecodable(type: T.self)
            .value()
            .mapError(APIError.init(error:))
            .eraseToAnyPublisher()
    }
}

enum APIError: Error {
    case invalidURL
    case unkownError(Error)
    init(error: AFError) {
        if error.isInvalidURLError {
            self = .invalidURL
        } else {
            self = .unkownError(error)
        }
    }
}



