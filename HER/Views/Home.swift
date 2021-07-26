//
//  Home.swift
//  HER
//
//  Created by Dustin yang on 7/4/21.
//


import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    
    
    // Hiding Tab Bar...
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        //        self._showMenu = false
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        // Tab View With Tabs...
        TabView(selection: $selectedTab){
            
            // Views...
            FeedView()
                .tag("Dashboard")
                .onTapGesture {
                }
            
            //
            CompanyView().tag("Search")
            
            
            ConversationView()
                .tag("Message")
            
            
            //
            SettingView()
                .tag("Settings")
            //
            //            Help()
            //                .tag("Help")
            //
            //            Notifications()
            //                .tag("Notifications")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SettingView: View {
    var body: some View {
        Text("Setting View")
    }
    
}
