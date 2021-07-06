//
//  CustomCorners.swift
//  HER
//
//  Created by Dustin yang on 7/4/21.
//

import SwiftUI

// Custom Corner Shapes...
struct CustomCorners: Shape {

    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
