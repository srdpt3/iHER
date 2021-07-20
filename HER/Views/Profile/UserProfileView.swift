//
//  UserProfileView.swift
//  HER
//
//  Created by Dustin yang on 7/4/21.
//

import SwiftUI

struct UserProfileView: View {
    private let user: User

    @ObservedObject private var viewModel: ProfileViewModel
    @State private var selectedFilter: PostFilterOptions = .post
    @State private var editProfilePresented = false


    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack{
                ProfileHeaderView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
                    .padding()

                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.posts(forFilter: selectedFilter))  { post in
                    
                    
                    if selectedFilter == .replies {
                        ReplyCell(post: post)
                            .padding()
                    } else {
                        DashboardCell(post: post)
                            .padding()
                    }
                }

            }
            .animation(.spring())
            .navigationBarTitle("blackrock")
             
 
        }
    }
}
//
//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
