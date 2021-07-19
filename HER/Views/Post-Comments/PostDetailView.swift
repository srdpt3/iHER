//
//  PostDetailView.swift
//  HER
//
//  Created by Dustin yang on 7/17/21.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                //                KFImage(URL(string: tweet.profileImageUrl))
                Image("p0")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("BlackRock")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(post.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Text(post.caption)
                .font(.system(size: 22))
            
            Text(post.detailedTimestampString)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Re Post")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    Text("\(post.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Divider()
            
            PostActionsView(post: post)

            
            Spacer()
        }.padding()
    }
}
