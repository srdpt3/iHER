//
//  SearchViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/14/21.
//

import SwiftUI
import Firebase
class SearchViewModel : ObservableObject {
    @Published var users = [User]()
    @Published  var company = [Company]()

    init(){
        fetchUsers()
        fetchCompany()

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
    
    
    func filteredUsers(_ query : String) -> [User] {
        let lowercasedQuery  = query.lowercased()
        return users.filter({ $0.username.lowercased().contains(lowercasedQuery)
                                ||  $0.company.lowercased().contains(lowercasedQuery)})
    }
    
    func fetchCompany(){
        Ref.FIRESTORE_COLLECTION_COMPANY.getDocuments { (snap, error) in
            if error != nil {
                print((error?.localizedDescription)!)

            }
            guard let documents = snap?.documents else { return }
            self.company = documents.map({Company(_dictionary: $0.data())})
        }
    }
   
    
    func filteredCompanies(_ query : String) -> [Company] {
        let lowercasedQuery  = query.lowercased()
        return company.filter({ $0.Company_Name.lowercased().contains(lowercasedQuery)
                                ||  $0.Ticker.lowercased().contains(lowercasedQuery)})
    }
    
}
