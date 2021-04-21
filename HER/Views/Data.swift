//
//  Data.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI


struct SampleData {
    static let scoreItems = [
        ScoreItem(title: "Data Score", color: Color.purple, score: "65", imageRoataion: 0, progress: 0.5),
        ScoreItem(title: "Sentimental", color: Color.appSkyBlue, score: "70 ", imageRoataion: 0, progress: 0.75),
        ScoreItem(title: "Ranking", color: Color.appPurple, score: "#5", imageRoataion: 0, progress: 0.25)
    ]
    
    static let Attributes = [
        Attribute(title: "management", imageName: "logo", value: 90, selected: true, imageColor: Color.purple, imageRotation: 0, scoreData: ConData),
        Attribute(title: "career", imageName: "logo", value: 100, selected: false, imageColor: Color.appSkyBlue, imageRotation: 0, scoreData: ConData1),
        Attribute(title: "benefit", imageName: "logo", value: 97, selected: false, imageColor: Color.appPurple, imageRotation: 0, scoreData: ConData2),
        Attribute(title: "worklife", imageName: "logo", value: 90, selected: false, imageColor: Color.purple, imageRotation: 0, scoreData: ConData3),
        Attribute(title: "innovation", imageName: "logo", value: 92, selected: false, imageColor: Color.appSkyBlue, imageRotation: 0, scoreData: ConData4)
    ]
    
    static let ConData = [
        ScoreData(month: "Jan", value: 24),
        ScoreData(month: "Feb", value: 56),
        ScoreData(month: "March", value: 12),
        ScoreData(month: "April", value: 90),
        ScoreData(month: "May", value: 23),
        ScoreData(month: "June", value: 45),
        ScoreData(month: "July", value: 87),
        ScoreData(month: "August", value: 51)
    ]
    
    static let ConData1 = [
        ScoreData(month: "Jan", value: 0),
        ScoreData(month: "Feb", value: 100),
        ScoreData(month: "March", value: 99),
        ScoreData(month: "April", value: 46),
        ScoreData(month: "May", value: 45),
        ScoreData(month: "June", value: 87),
        ScoreData(month: "July", value: 67),
        ScoreData(month: "August", value: 45)
    ]
    
    
    static let ConData2 = [
        ScoreData(month: "Jan", value: 88),
        ScoreData(month: "Feb", value: 88),
        ScoreData(month: "March", value: 88),
        ScoreData(month: "April", value: 97),
        ScoreData(month: "May", value: 88),
        ScoreData(month: "June", value: 88),
        ScoreData(month: "July", value: 88),
        ScoreData(month: "August", value: 90)
    ]
    
    
    static let ConData3 = [
        ScoreData(month: "Jan", value: 68),
        ScoreData(month: "Feb", value: 75),
        ScoreData(month: "March", value: 80),
        ScoreData(month: "April", value: 45),
        ScoreData(month: "May", value: 75),
        ScoreData(month: "June", value: 75),
        ScoreData(month: "July", value: 77),
        ScoreData(month: "August", value: 90)
    ]
    
    
    static let ConData4 = [
        ScoreData(month: "Jan", value: 86),
        ScoreData(month: "Feb", value: 87),
        ScoreData(month: "March", value: 76),
        ScoreData(month: "April", value: 86),
        ScoreData(month: "May", value: 65),
        ScoreData(month: "June", value: 56),
        ScoreData(month: "July", value: 85),
        ScoreData(month: "August", value: 92)
    ]
    
    static let ProData = [
        ScoreData(month: "Jan", value: 98),
        ScoreData(month: "Feb", value: 560),
        ScoreData(month: "March", value: 130),
        ScoreData(month: "April", value: 250),
        ScoreData(month: "May", value: 100),
        ScoreData(month: "June", value: 98),
        ScoreData(month: "July", value: 98),
        ScoreData(month: "August", value: 0)
        
    ]
}
