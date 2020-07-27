//
//  row.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 24/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation

struct Post: Identifiable, Codable {
    let title: String
    let body: String
    let userId: Int
    let id: Int
}

