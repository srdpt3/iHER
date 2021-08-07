//
//  MessageInputView.swift
//  HER
//
//  Created by Dustin yang on 7/3/21.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
//    let viewModel : ChatViewModel
    var action: () -> Void

    var body: some View {
        Rectangle()
            .foregroundColor(Color(.separator))
            .frame(width: UIScreen.main.bounds.width, height: 0.5)
            .padding(.bottom, 8)
        
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action) {
                Text("Send")
                    .bold()
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}
