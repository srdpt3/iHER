//
//  ProfileHeaderView.swift
//  HER
//
//  Created by Dustin yang on 7/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var editProfilePresented: Bool
    

    
    var body: some View {
        VStack {
            
            Image("profile")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120) 
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            Text(viewModel.user.company)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("Finance")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(viewModel.user.username)
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("\(viewModel.user.stats.followers)")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("\(viewModel.user.stats.following)")
                        .font(.system(size: 16)).bold()
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            ProfileActionButtonView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
            Spacer()
        }
    }
}

