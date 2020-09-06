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
            ZStack {
                List(viewModel.posts) { post in
                    NavigationLink(destination: PostsBuilder.postDetailsView(postID: post.id)) {
                        PostRow(post: post)
                    }
                }
                
                }//.snackBar(data:SnackBarInfo(title: "Error", type: .error, detail: viewModel.errorMessage),show: $viewModel.showBanner)
            }
            .navigationBarTitle("Posts")
        .onAppear(perform: {
            self.viewModel.fetchPosts()
        })
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

