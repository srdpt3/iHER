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
                        ForEach(viewModel.posts) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {
                                DashboardCell(post: post)
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
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $isShowingNewTweetView) {
                    NewPostView(isPresented: $isShowingNewTweetView)
                }
            }
            .navigationBarTitle("DashBoard")
            .navigationBarTitleDisplayMode(.inline)

        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
