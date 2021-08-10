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
    @State var index : Int = 0
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                //            WebImage(url: URL(string:company.logo)!)
                //                .resizable()
                //                .aspectRatio(contentMode: .fit)
                //                .frame(width: 120, height: 120)
                //                .cornerRadius(8)
                
//                AnimatedImage(url: URL(string:"https://companiesmarketcap.com/img/company-logos/256/UBER.png")!)
//                Image("p0")
                Image("profile")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60).cornerRadius(30)
                    .background(Color("blue"))
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
                    .padding(.trailing, 4)
                
         
//
                
                //                    .overlay(
                //                           RoundedRectangle(cornerRadius: 16)
                //                               .stroke(Color.blue, lineWidth: 4)
                //                       )
//
//                WebImage(url: URL(string:"https://companiesmarketcap.com/img/company-logos/256/UBER.png")!)
//                    .clipShape(Circle())
//                               .shadow(radius: 10)
//                               .overlay(Circle().stroke(Color.red, lineWidth: 5))
//                    .padding(.leading)
                VStack(alignment: .leading, spacing: 4) {
                    HStack (alignment: .top, spacing: 4) {
                        Text(post.username)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Text(" - Uber ")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                        
                        Text(post.timestampString)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        HStack(alignment: .top, spacing: 4){
                            Image(systemName:"eyes")
                                .font(.system(size: 14))
                                .frame(width: 16, height: 16)
                                .foregroundColor(.gray)

                            Text("0")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }

                        
                    }
                    
                    Text(post.caption)
                        .foregroundColor(.black)
                }
                
            }
            .padding(.top,5)
            .padding(.bottom,5)
            .padding(.horizontal)
//            .padding(.trailing)
            Divider() .frame(width: UIScreen.main.bounds.width)
            
            
            
            PostActionsView(post: post)
            
            if(index != 1){
                Rectangle()
                    .fill(Color("Color10"))
                    .frame(width: UIScreen.main.bounds.width,height: 7)
            }
            
            
        }
        //        .padding(.leading, -16)
        
        //        .padding(.leading, -16)
        
        
        
    }
}

//struct DashboardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardCell()
//    }
//}
