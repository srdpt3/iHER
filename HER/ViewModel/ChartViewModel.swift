//
//  ChartViewModel.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI
import Foundation

class ChartViewModel: ObservableObject {
    @Published var isLoading = false
    //    @Published var error: NSError?
    
    @Published var scoreData = [Score]()
    
    
    func loadChartData(companyName: String, onSuccess: @escaping(_ data: Score) -> Void) {
        isLoading = true
        
        //        Ref.FIRESTORE_COLLECTION_COMPANY.getDocuments { (snap, error) in
        
        Ref.FIRESTORE_COLLECTION_SCORES(name: "dkm8lwhobSgD4BYuqF9PN5uyag2").addSnapshotListener { (querySnapshot, error) in
            guard let document = querySnapshot else {
                print("No documents")
                return
            }
            
            var data : Score?
            
            //
            ////
            if(document.data() != nil){
                let _dictionary = document.data()!
//                let companyName = _dictionary["Company_Name"] as! String
//
//
//
//                let benefit_score = _dictionary["benefit_score"] as! Double
//                let career_score = _dictionary["career_score"] as! Double
//                let culture_score = _dictionary["culture_score"] as! Double
//                let innovation_score = _dictionary["innovation_score"] as! Double
//                let management_score = _dictionary["management_score"] as! Double
//                let soft_score = _dictionary["soft_score"] as! Double
//
//                let work_life_score = _dictionary["work_life_score"] as! Double
//
//                data = Score(Company_Name: companyName, benefit_score: benefit_score, career_score: career_score, culture_score: culture_score, innovation_score: innovation_score, management_score: management_score, soft_score:soft_score,work_life_score: work_life_score)
            }
            
            self.isLoading = false
            
            onSuccess(data!)
            
            
        }
        
    }
    
}

