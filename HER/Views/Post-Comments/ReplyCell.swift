//
//  ReplyCell.swift
//  HER
//
//  Created by Dustin yang on 7/18/21.
//

import SwiftUI

struct ReplyCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray)
                
                Text("replying to")
                    .foregroundColor(.gray)
                Text("@Blackrock")
                    .foregroundColor(.blue)
//                Text("@\(post.replyingTo ?? "")")
//                    .foregroundColor(.blue)
            }
            .padding(.leading)
            .font(.system(size: 12))
            
            DashboardCell(post: post)
        }
    }
}
