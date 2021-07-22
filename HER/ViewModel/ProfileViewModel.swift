//
//  ProfileViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/15/21.
//

import SwiftUI
import Firebase

class ProfileViewModel : ObservableObject {
    @Published var user : User
    @Published var userPosts = [Post]()
    @Published var likedPosts = [Post]()

    
    init(user : User){
        self.user = user
        checkIfUserIsFollowed()
        fetchUserPosts()
        fetchLikedPosts()
        fetchUserStats()
    }
    

    
    func posts(forFilter filter : PostFilterOptions) -> [Post] {
        switch filter {
        case .post: return userPosts
        case .likes: return  likedPosts
        case .replies: return userPosts
        }
        
    }
    
}


// MARK: - API

extension ProfileViewModel {
    
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        
        Ref.FIRESTORE_COLLECTION_FOLLOWING(name: currentUid).collection("following").document(self.user.id).setData([:]) { _ in
            Ref.FIRESTORE_COLLECTION_FOLLOWER(name: self.user.id).collection("followers").document(currentUid).setData([:]) { [self] _ in
                
                self.user.isFollowed  = true
                self.fetchUserStats()
            }
        }
        
    }
    
    func unfollow(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = Ref.FIRESTORE_COLLECTION_FOLLOWING(name: currentUid).collection("following")
        let followerRef = Ref.FIRESTORE_COLLECTION_FOLLOWER(name: self.user.id).collection("followers")
        
        
        followingRef.document(user.id).delete { _ in
            followerRef.document(currentUid).delete { _ in
                self.user.isFollowed = false
                self.fetchUserStats()
            }
        }
        
    }
    func checkIfUserIsFollowed(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        
        let followingRef = Ref.FIRESTORE_COLLECTION_FOLLOWING(name: currentUid).collection("following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed  = snapshot?.exists else { return }
            self.user.isFollowed  = isFollowed
        }
    }
    
    
    func fetchUserPosts() {
        Ref.FIRESTORE_COLLECTION_POSTS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.userPosts = documents.map({Post(dictionary: $0.data())})
            
            
        }
    }
    
    func fetchLikedPosts() {
        var posts = [Post]()
        Ref.FIRESTORE_COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let postIds = documents.map({$0.documentID})
            postIds.forEach { id in
                Ref.FIRESTORE_COLLECTION_POSTS.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else {return}
                    let post = Post(dictionary: data)
                    print("DEBUG: fetchLikedPosts \(post)")
                    posts.append(post)
                    guard posts.count == postIds.count else { return }
                    self.likedPosts = posts
                    
                    
                }
                
            }
        }
        
        
    }
    
    func fetchUserStats() {
        
        let followerRef = Ref.FIRESTORE_COLLECTION_FOLLOWER(name: self.user.id ).collection("followers")
        let followingRef = Ref.FIRESTORE_COLLECTION_FOLLOWING(name: self.user.id).collection("following")
        
        followerRef.getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count else { return }
                self.user.stats = UserStats(followers: followerCount, following: followingCount)

            }
        }
    }
    
    
}
