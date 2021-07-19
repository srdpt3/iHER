//
//  SideMenu.swift
//  HER
//
//  Created by Dustin yang on 7/4/21.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    @EnvironmentObject var homeData : AuthViewModel

//    @State var user : User
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            // Profile Pic...
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            // Padding top for Top Close Button...
                .padding(.top,50)
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text("asdfas")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {}, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
            })
            
            // tab Buttons...
            VStack(alignment: .leading,spacing: 10){
//                
//                FeedView().tabItem{
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//                
//                SearchView().tabItem{
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//                
//                
//                ConversationView().tabItem{
//                    Image(systemName: "envelope")
//                    Text("message")
//                }
                
                
//                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "clock.arrow.circlepath", title: "Dashboard", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "magnifyingglass", title: "Search", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "envelope", title: "Message", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "bell.badge", title: "Notifications", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "gearshape.fill", title: "Settings", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)

            }
            .padding(.leading,-15)
            .padding(.top,50)
            
            Spacer()
            
            // Sign Out Button...
            VStack(alignment: .leading, spacing: 6, content: {
                
                
                Button(action: {
                    homeData.signOut()
                }, label: {
                    Image(systemName: "rectangle.righthalf.inset.fill.arrow.right")
                })
                .padding(.leading,-15)
//.padding(.leading,-15)
//                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
//                    .padding(.leading,-15)
                
                Text("App Version 1.2.34")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
            })
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

