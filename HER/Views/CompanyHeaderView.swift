//
//  CompanyHeaderView.swift
//  HER
//
//  Created by Dustin yang on 7/20/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompanyHeaderView: View {
    var company : Company
    @ObservedObject var viewModel: CompanyViewModel
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 15) {
            
//            Image("logo")
//                .resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            
            HStack() {
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        //                            .padding()
                        .foregroundColor(Color("blue"))
                })
//                WebImage(url: URL(string:company.logo)!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(8).padding()
               Spacer()
                Text(company.desc)
                    .font(.caption)
                    .foregroundColor(.gray)

                
                
                //                        .lineLimit(4)
                
                //                Text("Uber")
                //                    .font(.title3)
                //                    .fontWeight(.bold)
                //                    .foregroundColor(.black)
                
            }
            .padding(.horizontal)
//            .padding(.top,8)
            
            VStack(alignment: .leading, spacing: 15){
                Text("Sector: \(company.Sector)")
                    .font(.callout)
                    .foregroundColor(Color("Color11"))
                Text("Ticker : \(company.Ticker)")
                    .font(.callout)
                    .foregroundColor(Color("Color11"))
                Text("Country \(company.Cntry_Of_Domicile)")
                    .font(.callout)
                    .foregroundColor(Color("Color11"))
            }
            .padding(.horizontal)
            
            HStack(spacing: 40) {
                VStack(spacing: 10) {
                    
                    
                    Text("Followers")
                        .font(.body)
                        .foregroundColor(Color("blue"))
                    Text("\(viewModel.company.stats.followers)")
                        .font(.system(size: 22)).bold()
                }
                
                VStack(spacing: 10) {
                    
                    Text("Sentimental Score")
                        .font(.body)
                        .foregroundColor(Color("blue"))
                    Text(viewModel.sentiment.score)
                        .font(.system(size: 22)).bold()
                    
                }
//                VStack(spacing: 10) {
//                    
//                    Text("Data Score")
//                        .font(.body)
//                        .foregroundColor(Color("blue"))
//                    Text("80")
//                        .font(.system(size: 22)).bold()
//                    
//                }
                
                
            } .padding(.horizontal)
            
            
        }.padding(.horizontal)
        CompanyActionButtonView(viewModel: viewModel)
        
    }
}

