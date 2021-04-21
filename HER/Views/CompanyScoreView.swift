//
//  CompanyScoreView.swift
//  HER
//
//  Created by Dustin yang on 3/28/21.
//

import SwiftUI



struct CompanyScoreView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(height: 160)
                .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Overall Score")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 30) {
                    ScoreItemView(activityItem: SampleData.scoreItems[0])
                    
                    ScoreItemView(activityItem: SampleData.scoreItems[1])
                    
                    ScoreItemView(activityItem: SampleData.scoreItems[2])
                }
            }
        }
    }
}

struct ScoreItemView: View {
    let activityItem: ScoreItem
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                
                Circle()
                    .trim(from: 0.0, to: activityItem.progress)
                    .stroke(activityItem.color, lineWidth: 3)
                    .frame(width: 70, height: 70)
                    .rotationEffect(.degrees(-90))
                
                
                Text(activityItem.score)
                    .foregroundColor(activityItem.color)
//                    .font(.system(size: 20, weight: .semibold))
                
//                Text(activityItem.score)
////                    .resizable().
//                frame(width: 30, height: 30)
//                    .foregroundColor(activityItem.color)
//                    .rotationEffect(.degrees(activityItem.imageRoataion))
            }
            
            Text(activityItem.title)
                .font(.system(size: 14))
        }
    }
}
