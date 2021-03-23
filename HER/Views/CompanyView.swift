//
//  CompanyView.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompanyView: View {
    @EnvironmentObject var companyData: Observer
    @State var showDashBoardView : Bool = false
    
    var body: some View {
        // Navigation View...
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack(spacing: 15){
                Spacer()
                // Search Bar...
                HStack(spacing: 10){
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search Company", text: $companyData.searchQuery)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.white)
                // Shadows..
                .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
            }
            .padding()
            
            if let companies = companyData.fetchedCompany{
                
                if companies.isEmpty{
                    // No results...
                    Text("No Results Found")
                        .padding(.top,20)
                }
                else{
                    
                    // Displaying results....
                    ForEach(companies,id: \.Bgei_Score){data in
                        
                        CompanyRowView(company: data)
                            .onTapGesture {
                                
                                
                                withAnimation{
                                    
                                    self.showDashBoardView = true
                                    
                                }
                                
                            }
                        
                        
                        Divider()
                        
                    }  .sheet(isPresented: self.$showDashBoardView){
                        CommentView()
                    }
                }
            }
            else{
                if companyData.searchQuery != ""{
                    // Loading Screem...
                    ProgressView()
                        .padding(.top,20)
                }
            }
        })
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Companies")
        .navigationBarHidden(true)
        .padding(.vertical, -5)
        
        
    }
    
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView()
    }
}

struct CompanyRowView: View {
    
    var company: Company
    
    var body: some View{
        
        HStack(alignment: .top,spacing: 10){
            
            WebImage(url: URL(string:company.logo)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
            Spacer()
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(company.Company_Name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                
                HStack{
                    Text("Hard Score")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                    Text(String(company.Bgei_Score))
                        .font(.caption)
                        .foregroundColor(Color("Color3"))
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }
                
                HStack{
                    Text("Soft Score")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                    Text(String(company.Bgei_Score))
                        .font(.caption)
                        .foregroundColor(Color("Color3"))
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }
                
                
                
                
                
                
                
                Text("Website")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                
                HStack{
                    
                    NavigationLink(
                        destination: WebView(url: URL(string:company.Website)!)
                            .navigationTitle(company.Website),
                        label: {
                            Text(company.Website).font(.caption)
                        })
                }
                
                // Links....
                //                HStack(spacing: 10){
                //
                //                    ForEach(company.Website,id: \.self){data in
                //
                //                        NavigationLink(
                //                            destination: WebView(url: extractURL(data: data))
                //                                .navigationTitle(extractURLType(data: data)),
                //                            label: {
                //                                Text(extractURLType(data: data))
                //                            })
                //                    }
                //                }
            })
            
            Spacer(minLength: 0)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        .padding(.horizontal)
    }
    
    func extractImage(data: [String: String])->URL{
        
        // combining both and forming image...
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        
        return URL(string: "\(path).\(ext)")!
    }
    
    func extractURL(data: [String:String])->URL{
        
        let url = data["url"] ?? ""
        
        return URL(string: url)!
    }
    
    func extractURLType(data: [String:String])->String{
        
        let type = data["type"] ?? ""
        
        return type.capitalized
    }
}
