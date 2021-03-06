//
//  DetailView.swift
//  ContactsAppEN
//
//  Created by Farukh IQBAL on 04/04/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import SwiftUI


struct PostDetailView: View {
    
    @ObservedObject var viewModel: PostDetailsViewModel
    
    var body: some View {
        
        Text(viewModel.content)
            .foregroundColor(.gray)
            .font(.callout)
            .onAppear(perform: {
                self.viewModel.fetchPostDetails()
            })
    }
    
    static func make(postID: Int) -> some View {
        return PostDetailView(viewModel: PostDetailsViewModel(postID: postID))
    }
}





