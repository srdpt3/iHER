//
//  DashBoardView.swift
//  HER
//
//  Created by Dustin yang on 3/28/21.
//

import SwiftUI


struct DashBoardView: View {
    @StateObject var attributeManager = AttributeManager()
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.appWhite)
                .ignoresSafeArea()
            
            VStack {
                // Top view with date
                TopView()
                ScoreMenuView()
                AttributeGraphView()
                AttributeValueView()
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .environmentObject(attributeManager)
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
