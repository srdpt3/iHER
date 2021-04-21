//
//  CurrentScoreView.swift
//  HER
//
//  Created by Dustin yang on 3/31/21.
//

import SwiftUI



struct CurrentScoreView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Score")
                .font(.system(size: 20, weight: .semibold))
            ProgressWithGoalView(title: "50 workout", initial: 0, goal: 50, currentValue: 36, progressColor: Color("receivedVote"))
            ProgressWithGoalView(title: "desired weight", initial: 55, goal: 61, currentValue: 58, progressColor: .appPurple, reverseGoal: true)
            ProgressWithGoalView(title: "desired weight", initial: 55, goal: 61, currentValue: 58, progressColor: .appSkyBlue, reverseGoal: true)
            ProgressWithGoalView(title: "desired weight", initial: 55, goal: 61, currentValue: 58, progressColor: Color("Color3"), reverseGoal: true)
            ProgressWithGoalView(title: "desired weight", initial: 55, goal: 61, currentValue: 58, progressColor: Color("color1"), reverseGoal: true)
            ProgressWithGoalView(title: "desired weight", initial: 55, goal: 61, currentValue: 58, progressColor: Color("color2"), reverseGoal: true)

        }
    }
}

struct ProgressWithGoalView: View {
    let title: String
    let initial: Int
    let goal: Int
    let currentValue: Int
    let progressColor: Color
    var reverseGoal = false

    var body: some View {
        VStack(spacing: 4) {
            ProgressView(title, value: getCurrentPercentageValue(), total: 100)
                .accentColor(progressColor)
                .foregroundColor(Color.gray.opacity(0.5))
            HStack {
                Text("\(reverseGoal ? goal : initial)")
                Spacer()
                Text("\(reverseGoal ? initial : goal)")
            }
        }
    }
    
    func getCurrentPercentageValue() -> Double {
        let value = ((currentValue - initial) * 100) / (goal - initial)
        return Double(value)
    }
}
