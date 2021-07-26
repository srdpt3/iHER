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
    var listener: ListenerRegistration!

    init(){
        fetchPostsListener()
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

    
    func fetchPostsListener() {
        listener = Ref.FIRESTORE_COLLECTION_POSTS.addSnapshotListener({ (querySnapshot, error) in
            guard let snapshot = querySnapshot else {
                return
            }
            
            snapshot.documentChanges.forEach { (documentChange) in
                switch documentChange.type {
                
                case .added:
                    //                    var activityArray = [Activity]()
                    print("type: added")
                    let dict = documentChange.document.data()
                    guard let decoderActivity = try?  Post.init(dictionary: dict) else {return}
                    self.posts.append(decoderActivity)
                    
                case .modified:
                    print("type: modified")
                    
                    
                case .removed:
                    print("type: removed")
                }
 
            }

        })
        
        
    }
    
}
