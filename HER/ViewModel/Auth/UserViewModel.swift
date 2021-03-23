//
//  UserViewModel.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI


class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var error: NSError?
    var buttonPressed = [Bool]()
    let  buttonTitle = [String]()
    

    
    
}

func saveUserLocally(mUserDictionary: NSDictionary) {
    print("Saved Locally")
    UserDefaults.standard.set(mUserDictionary, forKey: "currentUser")
    UserDefaults.standard.synchronize()
}


func saveUserLocationLocally(mUserDictionary: NSDictionary) {
    print("Saved User Profile Locally")
    UserDefaults.standard.set(mUserDictionary, forKey: "currentUserProfile")
    UserDefaults.standard.synchronize()
    
}


func signInFirstTime(mUserDictionary: NSDictionary) {
    print("Saved signInFirstTime")
    UserDefaults.standard.set(mUserDictionary, forKey: "signedIn")
    UserDefaults.standard.synchronize()
}

func resetDefaults() {
    print("resetDefaults")
    
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()
    dictionary.keys.forEach { key in
        defaults.removeObject(forKey: key)
    }
}

func removeDefaults(entry: String) {
    print("removeDefaults")
    if(isKeyPresentInUserDefaults(key: entry)){
        UserDefaults.standard.removeObject(forKey: entry)
    }
}

func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}


