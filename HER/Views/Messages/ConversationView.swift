//
//  CoversationView.swift
//  HER
//
//  Created by Dustin yang on 7/3/21.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                
//                NavigationLink(destination: ChatView(),
//                               isActive: $showChat,
//                               label: {
//
//                               }
//                )
                ScrollView {
                    VStack{
                        ForEach(0..<5){ _ in
//                             ConversationCell()
//                            NavigationLink(destination: ChatView(user: <#T##User#>),
//                                           label: {
//                                            ConversationCell()
//                                           }
//                            )
                        }
                    }.padding()
                    
                }
                Button(action: {
                    self.isShowingNewMessageView.toggle()
                }, label: {
                    Image(systemName: "envelope").resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32).padding()
                })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $isShowingNewMessageView, content: {
                    NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
                })
            }            .navigationBarTitle("Conversation")

        }

    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
