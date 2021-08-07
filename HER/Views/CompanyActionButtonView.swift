//
//  CompanyActionButtonView.swift
//  HER
//
//  Created by Dustin yang on 7/20/21.
//

import SwiftUI

struct CompanyActionButtonView: View {
    @ObservedObject var viewModel: CompanyViewModel
    
    
    var body: some View {
        
        HStack {
            Button(action: {
                viewModel.isFollowed ? viewModel.unfollowCompany() : viewModel.followCompany()
            }, label: {
                Text(viewModel.isFollowed ? "Following" : "Follow")
                    .frame(width: 175, height: 40)
                    .background(Color("blue"))
                    .foregroundColor(.white)
                
            })
            .cornerRadius(20)
            
            NavigationLink(destination:    ScoreView(companyName: viewModel.company.Company_Name), label: {
                
                HStack{
                    Text("View More")
                        .frame(width: 175, height: 40)
                                            .background(Color.purple)
                                            .foregroundColor(.white)
//                    Image("graph").resizable().aspectRatio(contentMode: .fit)
//                        .frame(width: 175, height: 40)
//                        .background(Color.purple)
//                        .foregroundColor(.white)
                    
//                    Image("graph").resizable().aspectRatio(contentMode: .fit)
                }

            })
            .cornerRadius(20)
            
            
            //                Button(action: { editProfilePresented.toggle() }, label: {
            //                    Text("Message")
            //                        .frame(width: 180, height: 40)
            //                        .background(Color.purple)
            //                        .foregroundColor(.white)
            //
            //                })
            //                .cornerRadius(20)
            
        }
        .padding()
        
        
        //        if User.currentUser().user.isCurrentUser {
        //            Button(action: { editProfilePresented.toggle() }, label: {
        //                Text("Edit Profile")
        //                    .frame(width: 360, height: 40)
        //                    .background(Color.blue)
        //                    .foregroundColor(.white)
        //
        //            })
        ////            .fullScreenCover(isPresented: $editProfilePresented) {
        ////                EditProfileView(isShowing: $editProfilePresented, user: viewModel.user)
        ////            }
        //            .cornerRadius(20)
        //        } else {
        
        //        }
    }
}
