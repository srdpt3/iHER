//
//  ChatView.swift
//  HER
//
//  Created by Dustin yang on 7/3/21.
//

import SwiftUI

struct ChatView: View {
    
    
    @State var messageText: String = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES){ message in
                        
                        MessageView(message: message)
                        
                     
                    }
                }
            }.padding(.top)
            
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
            
        }
//        .navigationTitle(user.username)
    }
    
    func sendMessage() {
//        viewModel.sendMessage(messageText)
        messageText = ""
    }
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
