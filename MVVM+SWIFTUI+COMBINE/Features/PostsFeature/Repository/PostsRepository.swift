//
//  PostsRepository.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine


protocol PostsRepositoryProtocol {
    func getPosts() -> AnyPublisher<[Post], APIError>
    func getPostDetails(postID: Int) -> AnyPublisher<Post, APIError>
}

class PostsRepository: PostsRepositoryProtocol {
    let apiClient: APIClientProtocol
    //TODO: — localClient in case there caching like doownloading files
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getPostDetails(postID: Int) -> AnyPublisher<Post, APIError> {
        self.apiClient.getData(request: PostsEndPoints.postDetails(postID: postID))
    }
    
    func getPosts() -> AnyPublisher<[Post], APIError> {
        self.apiClient.getData(request: PostsEndPoints.posts)
    }

}
