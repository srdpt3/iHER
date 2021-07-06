//
//  SearchView.swift
//  HER
//
//  Created by Dustin yang on 6/28/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        NavigationView{
            ScrollView {
                SearchBar(text: $searchText)
                    .padding()
                
                VStack(alignment: .leading) {
                    //
                    
                    ForEach(0..<1){_ in
                        HStack{ Spacer() }
                        
                        
                        NavigationLink(destination: UserProfileView(),
                                       label: {
                                        UserCell()
                                       }
                        )
                        
                    }
                }
            }
            .padding(.leading)
            .navigationBarTitle("Search")
            .navigationBarTitleDisplayMode(.inline) 
        }
    }
    
}




struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
