//
//  UploadPostViewModel.swift
//  HER
//
//  Created by Dustin yang on 7/16/21.
//

import SwiftUI
import Firebase

class UploadPostViewModel : ObservableObject {
    @Binding var isPresented : Bool
    
    init(isPresented : Binding<Bool>){
        self._isPresented = isPresented
    }
    
    func uploadPost(caption : String){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = Ref.FIRESTORE_COLLECTION_POSTS.document()
        
        let data : [String: Any]  = ["uid": user.id, "caption" : caption,
                                     "usernmae" : user.username,
                                     "companyId" : user.company,
                                     "timestamp": Timestamp(date: Date()),
                                     "likes" :0 , "id" : docRef.documentID]
        
        docRef.setData(data) { _ in
            print("DEBUG UploadPostViewModel : Successfully uploaded post..")
            self.isPresented = false
        }
    }
    
}
