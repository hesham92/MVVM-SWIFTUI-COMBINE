//
//  Environment.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 27/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

enum Environment: String {
    case development
    case testing
    
    init() {
        #if TESTING
        self = .testing
        #else
        self = .development
        #endif
    }
    
    var baseURL: String {
        switch self {
        case .development:
            return "https://jsonplaceholder.typicode.com/"
        case .testing:
            return "https://jsonplaceholder.typicode.com/"
        }
    }
}


