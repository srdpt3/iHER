//
//  LoginViewModel.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var gender = ""
    @Published var occupation = ""
    @Published var location = ""
    @Published var longitude = ""
    @Published var latitude = ""
    @Published var description = ""

    // Register...
    @Published var reEnter = ""
    
    // For Goto registration Page...
    @Published var gotoRegister = false
    
    // MacOS Data....
    var screen: CGRect{
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    // detecing For macOS...
    @Published var ismacOS = false
    
    init() {
        #if !os(iOS)
        self.ismacOS = true
        #endif
    }
    
    // Clearing Data When Going to Login / Register Page...
    func clearData(){
        email = ""
        password = ""
        reEnter = ""
    }
    
 
    func signup(username: String, email: String, password: String, age: String, gender: String, location: String, occupation:String,  longitude: String, latitude: String, description: String, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !email.isEmpty && !password.isEmpty {
            //            self.showLoader()
            
            print("register")
            AuthService.signupUser(username: username, email: email, password: password, age: age, gender: gender,location: location, occupation: occupation,  longitude: longitude, latitude: latitude, description: description, onSuccess: completed, onError: onError)
        }
        
        
    }
    
}
