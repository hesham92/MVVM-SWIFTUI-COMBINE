//
//  URLsessionClient.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 28/08/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine
/*
class URLsessionClient: APIClientProtocol {
   func getData<T: Decodable>(request: URLRequestConvertible) -> AnyPublisher<T, APIError> {
        do {
            return URLSession.shared.dataTaskPublisher(for: try request.asURLRequest())
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError(APIError.init(error:))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError(error: error)).eraseToAnyPublisher()
        }
   }
}

extension APIError {
    init(error: Error) {
        self = .unkownError(error)
    }
}
*/
