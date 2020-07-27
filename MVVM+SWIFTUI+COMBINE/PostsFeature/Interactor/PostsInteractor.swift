//
//  APIClient.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine


protocol PostsInteractorProtocol {
    func getPosts() -> AnyPublisher<[Post], APIError>
    func getPostDeatails(postID: Int) -> AnyPublisher<Post, APIError>
}

class PostsInteractor: PostsInteractorProtocol {
    func getPostDeatails(postID: Int) -> AnyPublisher<Post, APIError> {
        APIClient().getData(request: Router.postDetails(postID: postID))
    }
    
    func getPosts() -> AnyPublisher<[Post], APIError> {
        APIClient().getData(request: Router.posts)
    }
}
