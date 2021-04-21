//
//  AtrributeGraphsView.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI

struct AtrributeGraphsView: View {
    @EnvironmentObject var manager: AttributeManager
    var body: some View {
        ZStack {
            // Line graph for all 3 activity
            LineGraph(data: getScoresFromData(data: manager.attributes[0].scoreData))
                .stroke(manager.selectedAttributeIndex == 0 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedAttributeIndex == 0 ? 4 : 3)
            
            LineGraph(data: getScoresFromData(data: manager.attributes[1].scoreData))
                .stroke(manager.selectedAttributeIndex == 1 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedAttributeIndex == 1 ? 4 : 3)
            
            LineGraph(data: getScoresFromData(data: manager.attributes[2].scoreData))
                .stroke(manager.selectedAttributeIndex == 2 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedAttributeIndex == 2 ? 4 : 3)
            // Filled line graph for selected activity
            LineGraph(data: getScoresFromData(data: manager.attributes[3].scoreData))
                .stroke(manager.selectedAttributeIndex == 3 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedAttributeIndex == 3 ? 4 : 3)
            // Filled line graph for selected activity
            
            LineGraph(data: getScoresFromData(data: manager.attributes[4].scoreData))
                .stroke(manager.selectedAttributeIndex == 4 ? Color.appBlue : Color.gray.opacity(0.3), lineWidth: manager.selectedAttributeIndex == 4 ? 4 : 3)
            // Filled line graph for selected activity
            LineGraph(data: getScoresFromData(data: manager.attributes[manager.selectedAttributeIndex].scoreData))
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.appBlue.opacity(0.5), Color.appBlue.opacity(0.01)]),
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
    }
    
    func getScoresFromData(data: [ScoreData]) -> [CGFloat] {
        var scores: [CGFloat] = []
        
        for item in data {
            scores.append(item.value)
        }
        
        return scores
    }
}

struct HoursItemView: View {
    var body: some View {
        HStack(spacing: 40) {
            ForEach(SampleData.Attributes[0].scoreData) { data in
                Text(data.month)
                    .frame(width: 50, alignment: .center)
            }
        }
        .font(.system(size: 14))
        .foregroundColor(Color.gray.opacity(0.5))
    }
}
