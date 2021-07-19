//
//  CoversationCell.swift
//  HER
//
//  Created by Dustin yang on 7/3/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                //            WebImage(url: URL(string:user.profileImageUrl)!)
                //                .resizable()
                //                .scaledToFill()
                //                .clipped()
                //                .frame(width: 56, height: 56)
                //                .cornerRadius(28)
                Image("p0")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("test")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("asdfasdf")
                        .font(.system(size: 15))
                        .lineLimit(2)
                }
                .foregroundColor(.black)

                .padding(.trailing)
                Spacer()
            }
            Divider()
        }
        
    }
}


