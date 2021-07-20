//
//  ProfileActionButtonView.swift
//  HER
//
//  Created by Dustin yang on 7/5/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var editProfilePresented: Bool

    
    var body: some View {
        if viewModel.user.isCurrentUser  {
            Button(action: { editProfilePresented.toggle() }, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color("blue"))
                    .foregroundColor(.white)
                
            })
            .cornerRadius(20)
        }else{
            HStack {
                Button(action: {
                   viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color("blue"))
                        .foregroundColor(.white)
                    
                })
                .cornerRadius(20)
                
                NavigationLink(destination: ChatView(), label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
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
        }
        
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
