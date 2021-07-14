//
//  AuthViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/11/21.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseStorage

class AuthViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error : Error?
    @Published var user : User?

    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email : String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { authData, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            self.userSession = authData?.user

        }
    }
    
    
    func registerUser(email: String, password: String, username: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            let batch = Ref.FIRESTORE_ROOT.batch()
            
            
            guard let userId = authData?.user.uid else { return }
            let user = User.init(id: userId, email: email, profileImageUrl: "", username: username, age: "", gender: "", company: "", createdDate:  Date().timeIntervalSince1970)
            guard let dict = try? user.toDictionary() else {return}
            
            
            //            let userProfile = UserProfile.init(id: userId, email: email, profileImageUrl: "", username: username, age: age, gender: gender, createdDate:  Date().timeIntervalSince1970, location: location, occupation: occupation,  longitude: longitude, latitude: latitude, description: description)
            //            guard let dict2 = try? userProfile.toDictionary() else {return}
            
            
            
            let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
            batch.setData(dict, forDocument: firestoreUserId)
            ////
            ////            let userLocationRef = Ref.FIRESTORE_DOCUMENT_USER_LOCATION(userId: userId)
            ////            batch.setData(dict2, forDocument: userLocationRef)
            ////
            //
            batch.commit() { err in
                if let err = err {
                    print("Error writing batch \(err)")
                } else {
                    print("Batch persistMatching write succeeded.")
                    saveUserLocally(mUserDictionary: dict as NSDictionary)
                    
                    
                    self.userSession = authData?.user

                    //                    saveUserLocationLocally(mUserDictionary: dict2 as NSDictionary)
                    
                }
            }
            
            
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    
}
