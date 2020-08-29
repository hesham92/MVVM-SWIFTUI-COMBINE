//
//  APIClientProtocol.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 28/08/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine

protocol APIClientProtocol {
    func getData<T: Decodable>(request: URLRequestConvertible) -> AnyPublisher<T, APIError>
}
