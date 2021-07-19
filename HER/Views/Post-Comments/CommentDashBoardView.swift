//
//  DashBoardView.swift
//  HER
//
//  Created by Dustin yang on 6/26/21.
//

import SwiftUI

struct CommentDashBoardView: View {
    var body: some View {
      
            TabView {
                
                FeedView().tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                
                SearchView().tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                
                
                ConversationView().tabItem{
                    Image(systemName: "envelope")
                    Text("message")
                }
                
                
            }
        
    }
}

struct CommentDashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        CommentDashBoardView()
    }
}
