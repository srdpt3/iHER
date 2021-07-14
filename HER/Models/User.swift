//
//  User.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import Foundation
import FirebaseAuth

struct User: Encodable, Decodable ,Identifiable{
    //    var id: ObjectIdentifier
    
    var id : String
    var email: String
    var profileImageUrl: String
    var username: String
    var age: String
    var gender: String
    var company: String
    var createdDate : Double
    
    
    init(id: String, email: String, profileImageUrl: String, username: String, age: String, gender:String, company: String, createdDate : Double) {
        self.id = id
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.username = username
        self.age = age
        self.gender = gender
        self.company = company
        self.createdDate = createdDate
        
    }
    init(_dictionary: NSDictionary) {
        id = _dictionary["id"] as! String
        email = _dictionary["email"] as! String
        profileImageUrl = _dictionary["profileImageUrl"] as! String
        username = _dictionary["username"] as! String
        age = _dictionary["age"] as! String
        gender = _dictionary["gender"] as! String
        company = _dictionary["company"] as! String
        createdDate = _dictionary["createdDate"] as! Double
        
    
    }
    
    
    static func currentUser() -> User? {
        
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: "currentUser") {
                //                print(User.init(_dictionary: dictionary as! NSDictionary))
                
                return User.init(_dictionary: dictionary as! NSDictionary)
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

