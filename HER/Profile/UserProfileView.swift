//
//  UserProfileView.swift
//  HER
//
//  Created by Dustin yang on 7/4/21.
//

import SwiftUI

struct UserProfileView: View {
    @State private var selectedFilter: PostFilterOptions = .post

    var body: some View {
        ScrollView {
            VStack{
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
//                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
//                    if selectedFilter == .replies {
//                        ReplyCell(tweet: tweet)
//                            .padding()
//                    } else {
//                        TweetCell(tweet: tweet)
//                            .padding()
//                    }
//                }

            }
            .navigationBarTitle("blackrock")
             
 
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
