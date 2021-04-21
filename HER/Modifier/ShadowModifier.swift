//
//  ShadowModifier.swift
//  HER
//
//  Created by Dustin yang on 4/11/21.
//

import SwiftUI


struct ShadowModifier: ViewModifier {
    
    // changing based on ColorScheme
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        
        return content
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(colorScheme != .dark ? Color.white : Color.black)
            .cornerRadius(8)
            .clipped()
            .shadow(color: Color.primary.opacity(0.04), radius: 5, x: 5, y: 5)
            .shadow(color: Color.primary.opacity(0.04), radius: 5, x: -5, y: -5)
    }
}
