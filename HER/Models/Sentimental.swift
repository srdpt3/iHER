//
//  Sentimental.swift
//  HER
//
//  Created by Dustin yang on 7/23/21.
//

import SwiftUI

struct Sentimental: Identifiable {
    var id : String
    let score: String
    let companyId : String
    //    let profileImageUrl: String
    //    let fullname: String
    let count: Int
    
    //    var replyingTo: String?
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.score = dictionary["score"] as? String ?? ""
        self.companyId = dictionary["companyId"] as? String ?? ""
        self.count = dictionary["count"] as? Int ?? 0
    }
    
}
