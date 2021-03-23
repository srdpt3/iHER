//
//  SigninViewModel.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//


import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI

class SigninViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    var errorString = ""
    
    @Published var showAlert: Bool = false

    @Published var success: Bool = false
    @Published var show : Bool = false
    
    func signin(email: String, password: String, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !email.isEmpty && !password.isEmpty {
            
            resetDefaults()
                URLCache.shared.removeAllCachedResponses()
            AuthService.signInUser(email: email, password: password, onSuccess: completed, onError: onError)
            print("SigninViewModel  signin ")
            success = true
        } else {
            showAlert = true
            errorString = "Please fill out the form"
        }
       
    }
    
    func resetPasswordFor(email: String, completion: @escaping (_ error: Error?) -> Void) {
         
         Auth.auth().sendPasswordReset(withEmail: email) { (error) in
             completion(error)
         }
     }
}
