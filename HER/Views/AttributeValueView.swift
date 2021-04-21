//
//  AttributeValueView.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI

struct AttributeValueView: View {
    @EnvironmentObject var manager: AttributeManager
    var body: some View {
        HStack {
            ForEach(manager.attributes) { item in
                ValueItemView(item: item)
            }
        }
    }
}

struct ValueItemView: View {
    var item: Attribute
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(item.selected ? Color.appGrediantTopLeadingToBottomTrailling : Color.appGrediantWhite)
                .frame(height: 130)
            
            VStack {
                Image(item.imageName).resizable().frame(width: 40, height: 40)
                    .foregroundColor(item.selected ? Color.white : item.imageColor)
                    .rotationEffect(.degrees(item.imageRotation))
                    .padding(.bottom, 8)
                
                Text("\(item.value)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(item.selected ? Color.white : Color.black)
                
                Text("%")
                    .font(.system(size: 14))
                    .foregroundColor(item.selected ? Color.white : Color.black)
            }
        }
    }
}
