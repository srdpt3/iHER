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
    
    func uploadPost(caption : String, sentimet : String){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let user = AuthViewModel.shared.user else { return }
        
        
        let batch = Ref.FIRESTORE_ROOT.batch()

        
        let docRef = Ref.FIRESTORE_COLLECTION_POSTS.document()
        let data : [String: Any]  = ["uid": user.id, "caption" : caption,
                                     "usernmae" : user.username,
                                     "companyId" : user.company,
                                     "timestamp": Timestamp(date: Date()),
                                     "likes" :0 , "id" : docRef.documentID]
        
    
        batch.setData(data, forDocument: docRef)
        
        //        docRef.setData(data) { _ in
        //            print("DEBUG UploadPostViewModel : Successfully uploaded post..")
        //            self.isPresented = false
        //        }
        
        
        
        let docRef2 = Ref.FIRESTORE_COLLECTION_SENTIMENT.document( user.company)
        
        let data2 : [String: Any]  = ["companyId" : user.company,
                                     "score": sentimet,
                                     "count" :0]
        
        
//        batch.setData(data2, forDocument: docRef2)
        batch.updateData(["count" : FieldValue.increment(Int64(1)), "score": sentimet ], forDocument: docRef2)

        
        batch.commit() { err in
            if let err = err {
                print("Error writing batch \(err)")
                
            } else {
                print("DEBUG UploadPostViewModel : Successfully uploaded post..")
                self.isPresented = false
                
            }
        }
        
    }
    
}
