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


typealias URLRequestConvertible = Alamofire.URLRequestConvertible
typealias HTTPMethod = Alamofire.HTTPMethod


class AlamofireClient: APIClientProtocol {
    func getData<T: Decodable>(request: URLRequestConvertible) -> AnyPublisher<T, APIError> {
      //  print("Request Url:", try! request.asURLRequest())
       // print("Request Url:", try! request.asURLRequest().httpMethod)

        return AF.request(request)
            .publishDecodable(type: T.self)
            .value()
            .mapError(APIError.init(error:))
            .eraseToAnyPublisher()

    }
}

extension APIError {
    init(error: AFError) {
        self = .apiError
    }
}

enum APIError: Error {
    case apiError
    var message: String {
        switch self {
        case .apiError:
            return "Server Error"
        }
    }
}
