//
//  PostslistViewModel.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class PostslistViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var showBanner: Bool = false
    @Published var errorMessage: String = ""


    let postsRepository: PostsRepositoryProtocol
    var disposables = Set<AnyCancellable>()
    
    init(postsRepository: PostsRepositoryProtocol) {
        self.postsRepository = postsRepository
        self.fetchPosts()
    }
    
    func fetchPosts() {
        postsRepository.getPosts()
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure(let error):
                        self.showBanner = true
                       print(error.message)
                        self.posts = []
                    default:
                        break
                    }
                },
                receiveValue: { [weak self] posts in
                    guard let self = self else { return }
                    self.posts = posts
            })
            .store(in: &disposables)
    }
}
