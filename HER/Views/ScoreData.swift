//
//  CaloryData.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ScoreData: Identifiable {
    let id = UUID()
    let month: String
    let value: CGFloat
    var selected = false
}
