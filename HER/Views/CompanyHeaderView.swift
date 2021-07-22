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
        VStack(alignment: .leading, spacing: 15) {
            
            Image("logo")
                .resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            
            HStack() {
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        //                            .padding()
                        .foregroundColor(Color("color1"))
                })
                WebImage(url: URL(string:company.logo)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(8)
                
                Spacer()
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
                
                
                //                        .lineLimit(4)
                
                //                Text("Uber")
                //                    .font(.title3)
                //                    .fontWeight(.bold)
                //                    .foregroundColor(.black)
                
            }
            .padding(.horizontal,5)
            VStack{
                Text(company.desc)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal,5)
            
            HStack(spacing: 40) {
                VStack {
                    
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("\(viewModel.company.stats.followers)")
                        .font(.system(size: 16)).bold()
                }
                
                VStack {
                    
                    Text("Sentimental Score")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("0.8")
                        .font(.system(size: 16)).bold()
                    
                }
            }.padding(.horizontal).padding(.bottom)
            
            
        }.padding(.horizontal)
        CompanyActionButtonView(viewModel: viewModel)
        Spacer()
        
    }
}

