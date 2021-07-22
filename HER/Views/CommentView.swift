//
//  CommentView.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI

struct CommentView: View {
    private let company : Company
//    @Binding var show : Bool
    @Environment(\.presentationMode) var presentation
    @ObservedObject private var viewModel: CompanyViewModel
    @State private var selectedFilter: PostFilterOptions = .post
    @State private var editProfilePresented = false
    init(company: Company) {
        self.company = company
        self.viewModel = CompanyViewModel(company: company)
    }
    var body: some View {
        
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
            
            LazyVStack{
                CompanyHeaderView(company: company, viewModel: viewModel)
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.posts(forFilter: selectedFilter))  { post in
                    
                    
                    if selectedFilter == .replies {
                        ReplyCell(post: post)
                            .padding()
                    } else {
                        DashboardCell(post: post)
                            .padding()
                    }
                }
            }
            .animation(.spring())


//            VStack{
//                VStack{
//                    Text("Positive Comment")
//                        .font(.title2)
//                        .foregroundColor(Color("Color11"))
//                    AreaChartView().frame(height: 300)
//
//                }.padding(.horizontal)
//
//
//                VStack{
//                    Text("Negative Comment")
//                        .font(.title2)
//                        .foregroundColor(Color("Color11"))
//                    AreaChartView().frame(height: 300)
//
//                }.padding(.horizontal)
//                //                AreaChartView().frame(height: 300)
//
//                ScoreView(companyName: self.company.Company_Name)
//                    .frame(width: UIScreen.main.bounds.width - 30  , height: UIScreen.main.bounds.height/CGFloat(4))
//
//
//
//            }
//            Divider()
//            CommentHomeView()
        }
        .background(Color.white).onAppear(){
            viewModel.fetchAllCompanyPosts()
        }
        
        
        //        }
    }
}








struct CommentHomeView: View {
    
    @State var text = ""
    @State var chips : [[ChipData]] = []
    
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
                                    //                                    .fontWeight(.)
                                    //                                    .fontSize(10)
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(Color("color1"))
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color("color1")))
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
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 6)
            // Border...
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("color1"),lineWidth: 1.5))
            
            
            
            
            // TextEditor....
            
            TextEditor(text: $text)
                .padding()
                // Border With Fixed Size...
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("color1"),lineWidth: 1.5))
            
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
                    .background(Color("color1"))
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
