//
//  NewMessageView.swift
//  HER
//
//  Created by Dustin yang on 7/3/21.
//

import SwiftUI


struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
//    @Binding var user: User?
//    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()

            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
//                        self.user = user
                    }, label: {
                        UserCell()
                    })
                }
            }.padding(.leading)
        }
    }
}
