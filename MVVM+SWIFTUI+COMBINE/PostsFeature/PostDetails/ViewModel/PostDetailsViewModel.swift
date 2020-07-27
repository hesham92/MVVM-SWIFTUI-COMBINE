//
//  PostDetailsViewModel.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 25/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class PostDetailsViewModel: ObservableObject {
    
    @Published var content: String = ""
    private var disposables = Set<AnyCancellable>()
    private let postsInteractor: PostsInteractorProtocol
    
    init(postsInteractor: PostsInteractorProtocol, postID: Int) {
        self.postsInteractor = postsInteractor
        
        self.fetchPostDetails(postID: postID)
    }
    
    func fetchPostDetails(postID: Int) {
        postsInteractor.getPostDeatails(postID: postID)
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
