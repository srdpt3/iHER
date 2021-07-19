//
//  Observer.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Combine
import CryptoKit


class Observer : ObservableObject{
    
    @Published var searchQuery = ""
    
    // Combine Framework Search Bar....
    
    // used to cancel the search publisher when ever we need....
    var searchCancellable: AnyCancellable? = nil
    @Published var users = [User]()
    @Published var totalCount = 0
    @Published var showTab : Bool = false
    @Published var gender : String = ""
    
    @Published var last = 0
    @Published var isLoading : Bool = false
    @Published var isInBoxLoading : Bool = false
    
    @Published var isReloading : Bool = false
    @Published var newNotification : Bool = false
    @Published var fetchedCompany: [Company] = []
    @Published var myCompany: Company?

    //    @Published var activityArray = [UserNotification]()
    //    @Published var selectedUser = ActiveVote?
    
    
    
    @Published var error: NSError?
    
    @Published var index = -1;
    @Published var isLoggedIn = false
    
    @Published var readActivity = [String]()
    
    var handle: AuthStateDidChangeListenerHandle?
    
    
    //    var status: String    { return("\(lm.status)") }
    func getCompanyList(){
//        self.fetchedCompany.removeAll()
//        Ref.FIRESTORE_COLLECTION_COMPANY.getDocuments { (snap, error) in
//            if error != nil {
//                print((error?.localizedDescription)!)
//
//            }
//            for i in snap!.documents{
//                let dict = i.data()
//
//                guard let decoderActivity = try? Company.init(fromDictionary: dict) else {return}
//
////                if(decoderActivity.Company_Name == User.currentUser()!.company){
////                    self.myCompany = decoderActivity
////                }
//                self.fetchedCompany.append(decoderActivity)
//                //                print(decoderActivity)
//
//
//            }
//            print("company count \(self.fetchedCompany)")
//        }
    }
    

    
    
    
    
//    func listenAuthenticationState() {
//        resetDefaults()
//        self.fetchedCompany.removeAll()
//        
//        URLCache.shared.removeAllCachedResponses()
//        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
//            if let user = user {
//                print("listenAuthenticationState \(user.uid)")
//                let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: user.uid)
//                firestoreUserId.getDocument { (document, error) in
//                    if let dict = document?.data() {
//                        
//                        //                        guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
//                        guard let decoderUser = try? User.init(_dictionary: dict) else {return}
//                        guard let dictUser = try? decoderUser.toDictionary() else {return}
//                        
//                        saveUserLocally(mUserDictionary: dictUser as NSDictionary)
//                        self.isLoggedIn = true
//
//                        
//                        
//                        //                        self.getCompanyList()
//                        
//                        //                        let batch = Ref.FIRESTORE_ROOT.batch()
//                        //
//                        //                        let userLocationRef = Ref.FIRESTORE_DOCUMENT_USER_LOCATION(userId: decoderUser.id)
//                        //                        let userProfile = UserProfile.init(id: decoderUser.id, email: decoderUser.email, profileImageUrl: decoderUser.profileImageUrl, username: decoderUser.username, age: decoderUser.age, gender: decoderUser.gender, createdDate:  Date().timeIntervalSince1970, location: "", occupation: "",  longitude: "", latitude: "", description: "")
//                        //                        guard let dict2 = try? userProfile.toDictionary() else {return}
//                        //
//                        //                        saveUserLocationLocally(mUserDictionary: dict2 as NSDictionary)
//                        //
//                        
//                        //                        batch.setData(dict2, forDocument: userLocationRef)
//                        //
//                        //                        batch.commit() { err in
//                        //                            if let err = err {
//                        //                                print("Error writing batch \(err)")
//                        //                            } else {
//                        //                                print("Batch persistMatching write succeeded.")
//                        //
//                        //                            }
//                        //                        }
//                        
//                        
//                    }
//                }
//                
//            } else {
//                print("isLoogedIn is false")
//                self.isLoggedIn = false
//                //                self.userSession = nil
//                
//            }
//        })
//    }
    
    
    func resetCache(){
        resetDefaults()
        URLCache.shared.removeAllCachedResponses()
    }
    
    func logout() {
        
        do {
            
            users.removeAll()
            resetCache()
            try Auth.auth().signOut()
            
            
        } catch  {
            print("Logout Failed")
        }
    }
    
    // stop listening for auth changes
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
    
    
    var listener: ListenerRegistration!
    
    
    
    
    
    
}


