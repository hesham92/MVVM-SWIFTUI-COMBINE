//
//  NetworkErrors.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 28/08/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unkownError(Error)
}
