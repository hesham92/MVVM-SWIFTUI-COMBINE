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
   // @State var bannerData: BannerModifier.BannerData

    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: PostsFeature.postDetailsView(postID: post.id)) {
                    PostRow(post: post)
                }
            }
            .navigationBarTitle("Posts")
        }//.banner(data: $bannerData , show: $viewModel.showBanner)
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

