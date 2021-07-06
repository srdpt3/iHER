//
//  ProfileHeaderView.swift
//  HER
//
//  Created by Dustin yang on 7/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeaderView: View {
    @State private var editProfilePresented = false

    var body: some View {
        VStack {
            
            Image("p0")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            Text("Blackrock")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("Finance")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("sfdasdfasdfasdfasdfas")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("2000")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("1000")
                        .font(.system(size: 16)).bold()
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            ProfileActionButtonView(isCurrentUser: false, editProfilePresented: $editProfilePresented)
//            ProfileActionButtonView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
            Spacer()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
