//
//  FeedViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/15/21.
//

import SwiftUI
import Firebase

class FeedViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        Ref.FIRESTORE_COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.map({Post(dictionary: $0.data())})
            
//            print("DEBUG FeedViewModel: Post \(self.users)")
            //            documents.forEach { document in
            //                let user = User(_dictionary: document.data() as NSDictionary)
            //                self.users.append(user)
            //            }
        }
    }
    
}
