//
//  Message.swift
//  HER
//
//  Created by Dustin yang on 7/3/21.
//


import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }

    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "p0", messageText: "Hey what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "p1", messageText: "Not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "p0", messageText: "How's the marvel universe?", isCurrentUser: true),
    .init(id: 3, imageName: "p4", messageText: "It's pretty good dude", isCurrentUser: false),
    .init(id: 4, imageName: "p2", messageText: "How's your battle with the Joker?", isCurrentUser: false),
    .init(id: 5, imageName: "p3", messageText: "Not going so hot..", isCurrentUser: true),
]
