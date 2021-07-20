//
//  UserCell.swift
//  HER
//
//  Created by Dustin yang on 6/30/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            //            WebImage(url: URL(string:user.profileImageUrl)!)
            Image("p0")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
                
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.company)
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}
