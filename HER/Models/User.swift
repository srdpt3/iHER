//
//  User.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import Foundation
import FirebaseAuth

struct User: Identifiable{
    //    var id: ObjectIdentifier
    
    var id : String
    var email: String
    var profileImageUrl: String
    var username: String
    var age: String
    var company: String
    var createdDate : Double
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    var isFollowed = false
    var stats : UserStats

 
    
    init(id: String, email: String, profileImageUrl: String, username: String, age: String, company: String, createdDate : Double, stats: UserStats) {
        self.id = id
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.username = username
        self.age = age
        self.company = company
        self.createdDate = createdDate
        self.stats = stats
//        self.isCurrentUser = isCurrentUser
        
    }
    init(_dictionary: [String: Any]) {
        id = _dictionary["id"] as! String
        email = _dictionary["email"] as! String
        profileImageUrl = _dictionary["profileImageUrl"] as! String
        username = _dictionary["username"] as! String
        age = _dictionary["age"] as! String
        company = _dictionary["company"] as! String
        createdDate = _dictionary["createdDate"] as! Double
//        stats = _dictionary["UserStats"] as! UserStats

        self.stats = UserStats(followers: 0, following: 0)
        
    
    }
    
    
    static func currentUser() -> User? {
        
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: "currentUser") {
                //                print(User.init(_dictionary: dictionary as! NSDictionary))
                
                return User.init(_dictionary: dictionary as! [String : Any])
            }
        }
        
        
        return nil
    }
    
    
    static func currentUserProfile() -> UserProfile? {
        
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: "currentUserProfile") {
                return UserProfile.init(_dictionary: dictionary as! NSDictionary)
                
            }
            
            
        }
        return nil
        
    }
    
    
}

struct UserStats {
    let followers: Int
    let following: Int
}

