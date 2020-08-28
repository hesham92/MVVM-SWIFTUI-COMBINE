//
//  PostListViewBuilder.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 26/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import Foundation
import SwiftUI

enum PostListViewBuilder {
    static func make() -> some View {
    let postsRepository = PostsRepository(apiClient: CommonDependencies.makeAPIClient())
    let viewModel = PostslistViewModel(postsRepository: postsRepository)
    return PostsListView(viewModel: viewModel)
  }
}
