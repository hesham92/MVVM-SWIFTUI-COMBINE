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
import Alamofire

class PostslistViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    let postsInteractor: PostsInteractorProtocol
    var disposables = Set<AnyCancellable>()
    
    init(postsInteractor: PostsInteractorProtocol) {
        self.postsInteractor = postsInteractor
        self.fetchPosts()
    }
    
    func fetchPosts() {
        postsInteractor.getPosts()
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
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

extension PostslistViewModel {
    func postDetailsView(post: Post)  -> some View {
        return PostDetailsViewBuilder.make(postID: post.id, postsInteractor: self.postsInteractor
    )
  }
}

