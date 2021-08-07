//
//  ChatViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/27/21.
//


import SwiftUI

import Firebase

class ChatViewModel : ObservableObject {
    @Published var user : User
    
    
    
    init(user: User){
        self.user = user
        
    }
    
    func fetchMessages() {
        
        
    }
    
    func sendMessage(_ messageText : String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let currentUserRef = Ref.FIRESTORE_COLLECTION_MESSAGES(name: uid).collection(user.id).document()
        let receivingUserRef = Ref.FIRESTORE_COLLECTION_MESSAGES(name: user.id).collection(uid)
        
        let currentRecentRef = Ref.FIRESTORE_COLLECTION_MESSAGES(name: uid).collection("recent-message")
        let receivingRecentRef = Ref.FIRESTORE_COLLECTION_MESSAGES(name: user.id).collection("recent-message")
        
        let messageId = currentUserRef.documentID
        
        
        let data : [String: Any]  = ["text":messageText, "id" : messageId,"fromId":uid,"toId":user.id,
                                     "timestamp":Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageId).setData(data)
        currentRecentRef.document(uid).setData(data)
        receivingRecentRef.document(user.id).setData(data)
    }
    
    
    
}

