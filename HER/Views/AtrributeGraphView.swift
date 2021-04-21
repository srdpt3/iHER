//
//  AtrributeGraphView.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI

struct AttributeGraphView: View {
    @EnvironmentObject var manager: AttributeManager
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(height: 360)
                .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
            
            HStack {
                // scale view
                CaloryScaleView()
                    .offset(x: 10, y : -12)
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            // data graph
                            AtrributeGraphsView()
                            // view for selecting individual graph hour item value
                            GraphItemSelectionView()
                        }
                        .frame(height: 300)
                        // hour item
                       HoursItemView()
                    }
                }
            }
        }
    }
}

struct CaloryScaleView: View {
    var body: some View {
        VStack {
            Text("100%")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
            
            Text("50%")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
            
            Text("0%")
                .frame(width: 60, height: 100, alignment: .bottomLeading)
        }
        .font(.system(size: 14))
        .foregroundColor(Color.gray.opacity(0.5))
    }
}
