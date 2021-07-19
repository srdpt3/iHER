//
//  PostActionsView.swift
//  HER
//
//  Created by Dustin yang on 7/16/21.
//

import SwiftUI

struct PostActionsView: View {
    let post: Post
    @State var isShowingReplyView = false
    @ObservedObject var viewModel: PostActionViewModel
    
    init(post: Post) {
        self.post = post
        self.viewModel = PostActionViewModel(post: post)
    }
    
    var body: some View {
        HStack {
            Button(action: { self.isShowingReplyView.toggle() }, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }).sheet(isPresented: $isShowingReplyView, content: {
                NewPostView(isPresented: $isShowingReplyView)

//                NewTweetView(isPresented: $isShowingReplyView, tweet: tweet)
            })
            
            Spacer()
            
//            Button(action: {}, label: {
//                Image(systemName: "arrow.2.squarepath")
//                    .font(.system(size: 16))
//                    .frame(width: 32, height: 32)
//            })
            
//            Spacer()
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikePost() : viewModel.likePost()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
        }
        .foregroundColor(.gray)
        .padding(.horizontal)
        
    }
}

