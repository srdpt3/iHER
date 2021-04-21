//
//  MyCompanyView.swift
//  HER
//
//  Created by Dustin yang on 3/28/21.
//

import SwiftUI

struct MyCompanyView: View {
    @State var selection: Int? = nil
    @EnvironmentObject var companyData: Observer
    

    var body: some View {
        NavigationView {
            
            ZStack {
                // background color
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.appGrediant2)
                        .frame(height: 200)
                    
                    Rectangle()
                        .fill(Color.appWhite)
                }
                .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    // profile stats
                    if(companyData.myCompany != nil){
                        CompanyProfileView(company: companyData.myCompany!)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                    }

               
                    NavigationLink(
                        destination: DashBoardView()
                            .navigationTitle("")
                            .navigationBarHidden(true),
                        tag: 1,
                        selection: $selection,
                        label: {
                            // Daily activity view
                            CompanyScoreView()
                                .foregroundColor(Color("Color11"))
                                .onTapGesture {
                                    selection = 1
                                }
                            
                        }
                    )
                    
                    VStack{
                     
                        
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.white)
//                                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                                    .frame(height: 140)
                                LazyVStack {
                                    Text("58%")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.appBlue)
                                    Text("Best For Career")
                                        .foregroundColor(Color("Color11"))
                                }
                            }

                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)

                                    .fill(Color.white)
//                                    .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                                    .frame(height: 140)

                                VStack {
                                    Text("37%")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.appBlue)
                                    Text("Lack Of Management")
                                        .foregroundColor(Color("Color11"))
                                }
                            }
                        }
                
                    }
                    .cornerRadius(25)
            
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)

                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 10, y: 10)
                            .frame(width: UIScreen.main.bounds.width - 25  , height: UIScreen.main.bounds.height/CGFloat(3.6))

                        LazyVStack {
                            ScoreView(companyName: User.currentUser()!.company )
                                .frame(width: UIScreen.main.bounds.width - 25  , height: UIScreen.main.bounds.height/CGFloat(3.6))
//                                .offset(y: -10)
                                .cornerRadius(25)
                        }
                    }
                 
                   
//                    AreaChartView()
//                        .frame(height: 300)

//
//                    ScoreView(companyName: User.currentUser()!.company )
////                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/CGFloat(3.96) )
//                        .cornerRadius(25)
                    // Dashboard view

                    
                  Spacer()
                }
                .padding(.horizontal)
                
//                .padding(.bottom, 10)
            }
            .navigationTitle("")
            .navigationBarHidden(true).ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 10).onAppear(){
                companyData.getCompanyList()
            }

        
        }
   
    }
    

}

//struct MyCompanyView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCompanyView()
//    }
//}
