//
//  CommentView.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentView: View {
    @Binding var companyName : String
    @Binding var show : Bool
    var body: some View {
        
        
        VStack {
            HStack{
                WebImage(url: URL(string:"data:image/png;base64,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")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                
                
                Text("Uber Technologies, Inc. provides ride hailing services. The Company develops applications for road transportation, navigation, ride sharing, and payment processing solutions. Uber Technologies serves customers worldwide.")
                    .font(.caption)
                    .foregroundColor(.gray)
//                        .lineLimit(4)
                
//                Text("Uber")
//                    .font(.title3)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
          
            }.padding(.horizontal)
            
            
            ScoreView(companyName: self.$companyName)
            //        NavigationView{
            CommentHomeView()
//                .navigationTitle("word clouds")
        }
 

        //        }
    }
}








struct CommentHomeView: View {
    
    @State var text = ""
    @State var chips : [[ChipData]] = [[ChipData(chipText: "Great supplementary income")],[ChipData(chipText: "Flexible hours")]]
    
    var body: some View{
        
        VStack(spacing: 35){
            
//
//            Text("Add comments")
//
//
//            Spacer()
            ScrollView{
                // Chips View...
                LazyVStack(alignment: .leading,spacing: 10){
                    
                    // Since Were Using Indices So WE Need To Specify Id....
                    ForEach(chips.indices,id: \.self){index in
                        
                        HStack{
                            
                            // some times it asks us to specify hashable in Data Model...
                            ForEach(chips[index].indices,id: \.self){chipIndex in
                                
                                Text(chips[index][chipIndex].chipText)
                                    .fontWeight(.semibold)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.black,lineWidth: 1))
                                    .lineLimit(1)
                                    // Main Logic......
                                    .overlay(
                                        
                                        GeometryReader{reader -> Color in
                                            
                                            // By Using MaxX Parameter We Can Use Logic And Determine if its exceeds or not....
                                            
                                            let maxX = reader.frame(in: .global).maxX
                                            
                                            // Both Paddings  = 30+ 30 = 60
                                            // Plus 10 For Extra....
                                            
                                            // Doing Action Only If The Item Exceeds...
                                            
                                            if maxX > UIScreen.main.bounds.width - 70 && !chips[index][chipIndex].isExceeded{
                                                
                                                // It is updating to each user interaction....
                                                
                                                DispatchQueue.main.async {
                                                    
                                                    // Toggling That...
                                                    chips[index][chipIndex].isExceeded = true
                                                    
                                                    // Getting Last Item...
                                                    let lastItem = chips[index][chipIndex]
                                                    // removing Item From Current Row...
                                                    // inserting it as new item...
                                                    chips.append([lastItem])
                                                    chips[index].remove(at: chipIndex)
                                                }
                                            }
                                            
                                            return Color.clear
                                        },
                                        alignment: .trailing
                                    )
                                    .clipShape(Capsule())
                                    .onTapGesture {
                                        // Removing Data...
                                        chips[index].remove(at: chipIndex)
                                        // If the Inside Array is empty removing that also...
                                        if chips[index].isEmpty{
                                            chips.remove(at: index)
                                        }
                                    }
                            }
                        }
                    }
                    
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 7)
            // Border...
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4),lineWidth: 1.5))
            // TextEditor....
            
            TextEditor(text: $text)
                .padding()
                // Border With Fixed Size...
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4),lineWidth: 1.5))
            
            // Add Button...
            
            Button(action: {
                
                // Adding Empty Array if there is Nothing....
                if chips.isEmpty{
                    chips.append([])
                }
                
                // Adding Chip To Last Array....
                chips[chips.count - 1].append(ChipData(chipText: text))
                // Clearing Old Text In Editor
                text = ""
                
            }, label: {
                Text("Add Comment")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(Color("ColorPink"))
                    .cornerRadius(4)
            })
            // Disabling Button When Text is Empty...
            .disabled(text == "")
            .opacity(text == "" ? 0.45 : 1)
        }
        .padding()
    }
}

// Chip Data Model....

struct ChipData: Identifiable {
    var id = UUID().uuidString
    var chipText : String
    // To Stop Auto Update...
    var isExceeded = false
}
