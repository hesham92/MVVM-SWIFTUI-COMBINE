//
//  ContentView.swift
//  MVVM+SWIFTUI+COMBINE
//
//  Created by hesham hassan on 24/07/2020.
//  Copyright © 2020 hesham Elsherif. All rights reserved.
//

import SwiftUI

struct PostsListView: View {
    
    @ObservedObject var viewModel: PostslistViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: self.viewModel.postDetailsView(post: post)) {
                    PostRow(post: post)
                }
            }
            .navigationBarTitle("Posts")
        }
    }
}

struct PostRow: View {
    let post: Post
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.system(size: 21, weight: .medium, design: .default))
            }
        }
    }
}

