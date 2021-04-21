//
//  ScoreMenuView.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI

struct ScoreMenuView: View {
    @EnvironmentObject var manager: AttributeManager
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(manager.attributes) { acctribute in
                    AtrributeMenuItemView(item: acctribute)
                        .onTapGesture {
                            withAnimation {
                                manager.selectAttribute(item: acctribute)
                            }
                        }
                }
            }.padding(.horizontal, 10)
        }
    }
}

struct AtrributeMenuItemView: View {
    var item: Attribute
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.appBlue, lineWidth: 2)
                .frame(height: 40)
                .opacity(item.selected ? 1.0 : 0.0)
            
            Text(item.title)
                .padding(16)
                .foregroundColor(item.selected ? Color.black : Color.gray)
        }
        .fixedSize()
    }
}
