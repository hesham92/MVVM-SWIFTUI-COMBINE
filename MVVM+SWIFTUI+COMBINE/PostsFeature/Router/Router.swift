//
//  Router.swift
//  Development
//
//  Created by hesham hassan on 13/08/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//


import Foundation
import SwiftUI

enum PostsRoute {
    
    case postDetailsView(post: Post)
    
    // MARK: - Properties
    
    var destination:  some View {
        switch self {
        case .postDetailsView(let post):
            return PostDetailsViewBuilder.make(postID: post.id)
        }
    }
}
