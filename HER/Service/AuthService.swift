//
//  AuthService.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//
import SwiftUI

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
class AuthService {
    
    static func logout(){
        do {
            
         
            try Auth.auth().signOut()
            
            
            
            
            //            unbind()
        } catch  {
            print("Logout Failed")
        }
    }
    
    static func signInUser(email: String, password: String, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            
            let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
            firestoreUserId.getDocument { (document, error) in
                if let dict = document?.data() {
                    guard let decoderUser = try? User.init(_dictionary: dict as NSDictionary) else {return}
                    
                    
                    
                    
                    //                    guard let decoderUser2 = try? UserProfile.init(_dictionary: dict as NSDictionary) else {return}
                    
                    
                    saveUserLocally(mUserDictionary: dict as NSDictionary)
                    
                    
                    onSuccess(decoderUser)
                }
            }
        }
        
        
    }
    
    
    static func saveUser(userId: String){
        let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
        firestoreUserId.getDocument { (document, error) in
            if let dict = document?.data() {
                //                guard let decoderUser = try? User.init(_dictionary: dict as NSDictionary) else {return}
                saveUserLocally(mUserDictionary: dict as NSDictionary)
                print("Save Locally")
            }
        }
    }
    
    static func signupUser(username: String, email: String, password: String, age: String, gender: String, location: String, occupation:String,  longitude: String, latitude: String, description: String, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        //Firebase.createAccount(username: username, email: email, password: password, imageData: imageData)
        resetDefaults()
        URLCache.shared.removeAllCachedResponses()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            let batch = Ref.FIRESTORE_ROOT.batch()

            
            guard let userId = authData?.user.uid else { return }
            let user = User.init(id: userId, email: email, profileImageUrl: "", username: username, age: age, gender: gender, createdDate:  Date().timeIntervalSince1970)
                        guard let dict = try? user.toDictionary() else {return}
            

            let userProfile = UserProfile.init(id: userId, email: email, profileImageUrl: "", username: username, age: age, gender: gender, createdDate:  Date().timeIntervalSince1970, location: location, occupation: occupation,  longitude: longitude, latitude: latitude, description: description)
            guard let dict2 = try? userProfile.toDictionary() else {return}
            
            
            
            let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
            batch.setData(dict, forDocument: firestoreUserId)
        
            let userLocationRef = Ref.FIRESTORE_DOCUMENT_USER_LOCATION(userId: userId)
            batch.setData(dict2, forDocument: userLocationRef)
            
            
            batch.commit() { err in
                if let err = err {
                    print("Error writing batch \(err)")
                } else {
                    print("Batch persistMatching write succeeded.")
                    saveUserLocally(mUserDictionary: dict as NSDictionary)
                    saveUserLocationLocally(mUserDictionary: dict2 as NSDictionary)
                    
                }
            }
            

        }
    }
}
