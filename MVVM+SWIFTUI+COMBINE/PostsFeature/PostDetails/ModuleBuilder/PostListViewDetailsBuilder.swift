//
//  PostListViewDetailsBuilder.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 26/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import SwiftUI


enum PostDetailsViewBuilder {
  static func make(postID: Int) -> some View {
    let postsRepository = PostsRepository(apiClient: CommonDependencies.makeAPIClient())
    let viewModel = PostDetailsViewModel(postsRepository: postsRepository, postID: postID)
    return PostDetailView(viewModel: viewModel)
  }
}
