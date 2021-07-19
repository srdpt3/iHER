//
//  ValueItem.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct Attribute: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let value: Int
    var selected: Bool
    let imageColor: Color
    let imageRotation: Double
    var scoreData: [ScoreData]
}
