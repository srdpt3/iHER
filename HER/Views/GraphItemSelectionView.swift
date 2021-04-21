//
//  GraphItemSelectionView.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI

struct GraphItemSelectionView: View {
    @EnvironmentObject var manager: AttributeManager
    var body: some View {
        HStack(spacing: 40) {
            ForEach(manager.attributes[0].scoreData) { data in
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.black.opacity(0.0005))
                        .frame(width: 50)
                        .onTapGesture {
                            withAnimation {
                                manager.selectBar(month: data.month)
                            }
                    }

                    Group {
                        VertialLine()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(width: 1, height: getSelectedBarHeight(month: data.month))

                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)
                            .offset(y : -getSelectedBarHeight(month: data.month) + 6)

                        Circle()
                            .strokeBorder(Color.appBlue, lineWidth: 4)
                            .frame(width: 12, height: 12)
                            .offset(y : -getSelectedBarHeight(month: data.month) + 6)

                        HStack {
                            Image(systemName: "flame")
                                .foregroundColor(.red)
                            Text(String.init(format: "%.0f", (getSelectedBarHeight(month: data.month) * 2.5)))
                        }
                        .font(.system(size: 12))
                        .offset(y : -getSelectedBarHeight(month: data.month) - 16)
                    }
                    .opacity(getIsBarSelected(month: data.month) ? 1.0 : 0.0)
                }
            }
        }
    }
    
    func getSelectedBarHeight(month: String) -> CGFloat {
        var value: CGFloat = 0.0
        for item in manager.getScoreDataForSelectedIndex() {
            if item.month == month {
                value = item.value
            }
        }
        return value / 0.5// for height ratio
    }
    
    func getIsBarSelected(month: String) -> Bool {
        var selected = false
        if manager.getSelectedScoreMonth() == month {
            selected = manager.getIsSelectedMonthSelected()
        }
        return selected
    }
}

struct VertialLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        return path
    }
}
