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
    @Binding var isPresented: Bool


    init(user: User, isPresented: Binding<Bool>) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        self._isPresented = isPresented
    }
    
    var body: some View {
        ScrollView {
            LazyVStack{
                HStack{
                    Button(action: { isPresented.toggle() }, label: {
                        Text("Cancel")
                            .foregroundColor(Color("blue"))
                    })
                    Spacer()
                }.padding(.horizontal).padding(.top)

                
                ProfileHeaderView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
                    .padding()

//                FilterButtonView(selectedOption: $selectedFilter)
//                    .padding()
//
//                ForEach(viewModel.posts(forFilter: selectedFilter))  { post in
//
//
//                    if selectedFilter == .replies {
//                        ReplyCell(post: post)
//                            .padding()
//                    } else {
//                        DashboardCell(post: post)
//                            .padding()
//                    }
//                }

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
