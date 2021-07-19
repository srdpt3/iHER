//
//  SearchViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/14/21.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseStorage
class SearchViewModel : ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        Ref.FIRESTORE_COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({User(_dictionary: $0.data())})
            
            print("DEBUG SearchViewModel: Users \(self.users)")
//            documents.forEach { document in
//                let user = User(_dictionary: document.data() as NSDictionary)
//                self.users.append(user)
//            }
        } 
    }
    
}
