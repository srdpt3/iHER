//
//  DashboardCell.swift
//  HER
//
//  Created by Dustin yang on 6/27/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DashboardCell: View {
    
    let post : Post
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                //            WebImage(url: URL(string:company.logo)!)
                //                .resizable()
                //                .aspectRatio(contentMode: .fit)
                //                .frame(width: 120, height: 120)
                //                .cornerRadius(8)
                
                Image("p0").resizable().scaledToFill()
                    .clipped().frame(width: 56, height: 56)
                    .cornerRadius(56/2).padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(post.username)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        
                        Text("BlackRock")
                            .foregroundColor(.gray)
                        
                        Text("2021/06/27")
                            .foregroundColor(.gray)
                    }
                    
                    Text(post.caption)
                        .foregroundColor(.black)
                }
                
            }
            .padding(.bottom)
            .padding(.trailing)
            
            
            PostActionsView(post: post)
            
            Divider()

        }
        .padding(.leading, -16)

        
        
    }
}

//struct DashboardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardCell()
//    }
//}
