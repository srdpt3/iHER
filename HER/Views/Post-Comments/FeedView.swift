//
//  FeedView.swift
//  HER
//
//  Created by Dustin yang on 7/15/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()

    var body: some View {
        
        
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        ForEach(Array(viewModel.posts.enumerated()), id: \.1.id) { (index, post) in
                            NavigationLink(destination: PostDetailView(post: post)
                                            .navigationTitle("")
                                            .navigationBarHidden(true)) {
                                if(index == viewModel.posts.count - 1){
                                    DashboardCell(post: post, index: 1)
                                }else{
                                    DashboardCell(post: post, index: 0)

                                }

                            }
                        }

                    }.padding()
                }
                
                Button(action: {
                        isShowingNewTweetView.toggle() }, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .padding()
                })
                .background(Color("blue"))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $isShowingNewTweetView) {
                    NewPostView(isPresented: $isShowingNewTweetView).onDisappear(){
//                        viewModel.fetchPosts()
                    }
                }
            }
            .navigationBarTitle("DashBoard")
            .navigationBarTitleDisplayMode(.inline)

        }
        .onAppear(){
//            viewModel.fetchPosts()
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
