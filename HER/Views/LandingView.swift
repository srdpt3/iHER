//
//  LandingView.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI

struct LandingView: View {
    static var shouldAnimate = true

    var body: some View {
        LandingSubView()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}


struct LandingSubView : View {
    @State var multiColor = true
    
    var body: some View{
        VStack(spacing: 25){
            Spacer()

            TextShimmer(text: "HACK:BLK", multiColors: $multiColor)
            
            TextShimmer(text: "", multiColors: $multiColor)
            
            TextShimmer(text: "iHER", multiColors: $multiColor)
            
            Spacer()
          
//            Toggle(isOn: $multiColor, label: {
//                Text("Enable Multi Colors")
//                    .font(.title)
//                    .fontWeight(.bold)
//            })
//            .padding()
        }
        .preferredColorScheme(.dark)
    }
}


struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(.system(size: 55, weight: .bold))
                .foregroundColor(Color.white.opacity(0.25))
            
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 75, weight: .bold))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }
            // Masking For Shimmer Effect...
            .mask(
                
                Rectangle()
                    // For Some More Nice Effect Were Going to use Gradient...
                    .fill(
                        
                        // You can use any Color Here...
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    // Moving View Continously...
                    // so it will create Shimmer Effect...
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
                
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
        }
    }
    
    
    func randomColor()->Color{
        
        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
    
}
