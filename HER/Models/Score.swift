//
//  Score.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI


import Foundation

struct Score: Encodable, Decodable {
    var Company_Name :String
    var benefit_score: Double
    var career_score: Double
    var culture_score: Double
    var innovation_score: Double
    var management_score: Double
    var soft_score: Double
    var work_life_score: Double
    
    
    
    init(Company_Name: String, benefit_score: Double, career_score: Double, culture_score: Double, innovation_score: Double, management_score:Double, soft_score: Double, work_life_score: Double
    ) {
        self.Company_Name = Company_Name
        self.benefit_score = benefit_score
        self.career_score = career_score
        self.culture_score = culture_score
        self.innovation_score = innovation_score
        self.management_score = management_score
        self.soft_score = soft_score
        self.work_life_score = work_life_score
        
        
    }
    init(_dictionary: NSDictionary) {
        
        Company_Name = _dictionary["Company_Name"] as! String
        benefit_score = _dictionary["benefit_score"] as! Double
        career_score = _dictionary["career_score"] as! Double
        innovation_score = _dictionary["innovation_score"] as! Double
        culture_score = _dictionary["culture_score"] as! Double
        management_score = _dictionary["management_score"] as! Double
        soft_score = _dictionary["soft_score"] as! Double
        work_life_score = _dictionary["work_life_score"] as! Double
        
        
        
    }
    
}
