//
//  CompanyProfileView.swift
//  HER
//
//  Created by Dustin yang on 3/28/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompanyProfileView: View {
  @State var company: Company
    
    var body: some View {
        LazyHStack(spacing: 36) {
            ZStack {
//                Circle()
//                    .strokeBorder(lineWidth: 1)
//                    .frame(width: 100, height: 100)
                
//                WebImage(url: URL(string:company.logo)!)
////                    .resizable().aspectRatio(contentMode: .fill)
////                    .scaledToFit()
//                    .frame(width: 95, height: 95).cornerRadius(44)

                WebImage(url: URL(string:company.logo)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                    .cornerRadius(8)
                
                
                
//                Image("pic")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 90, height: 90)
            }.padding(.top, 15)
            
            LazyVStack(alignment: .leading, spacing: 10) {
                

                
                Text(company.Company_Name)
                    .font(.system(size: 22, weight: .semibold))
                
                HStack(spacing: 36) {
                    VStack {
                        Text(company.Cntry_Of_Domicile)
                            .font(.system(size: 15, weight: .bold))
                        
                        Text(company.ticker)
                            .font(.system(size: 15, weight: .bold))
                    }

                }
            }
        }
//        .onAppear(){
//            getCompanyLogo();
//        }
    }
}
