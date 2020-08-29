//
//  PostDetailsViewModel.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine

class PostDetailsViewModel: ObservableObject {
    
    @Published var content: String = ""
    private var disposables = Set<AnyCancellable>()
    private let postsRepository: PostsRepositoryProtocol
    
    init(postsRepository: PostsRepositoryProtocol, postID: Int) {
        self.postsRepository = postsRepository
        
        self.fetchPostDetails(postID: postID)
    }
    
    func fetchPostDetails(postID: Int) {
        postsRepository.getPostDetails(postID: postID)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.content = ""
                    default:
                        break
                    }
                },
                receiveValue: { [weak self] post in
                    guard let self = self else { return }
                    self.content = post.body
            })
            .store(in: &disposables)
    }
}
