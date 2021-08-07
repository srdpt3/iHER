//
//  CompanyView.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct CompanyView : View {
    
    //    @EnvironmentObject var companyData: Observer
    @State var searchText = ""
    @ObservedObject var viewModel  = SearchViewModel()
    @State var showDashBoardView : Bool = false
    
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    
    //    init(){
    //        self.companyData.getCompanyList()
    //    }
    var body: some View{
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                //
                LazyVStack{
                    
                    //                HStack{
                    //
                    //                    Text("Highlighed Company")
                    //                        .font(.callout)
                    //                        .fontWeight(.bold)
                    //
                    //                    Spacer()
                    //                }
                    //                .padding(.horizontal)
                    //
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                        .padding(.top,10)
                    //
                    //                // Carousel List...
                    //
                    //
                    //                TabView(selection: self.$index){
                    //
                    //                    ForEach(2...5,id: \.self){index in
                    //                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    //                            Image("p\(index)")
                    //                                .resizable()
                    //                                // adding animation...
                    //                                .frame(height: self.index == index ?  220 : 180)
                    //                                .cornerRadius(15)
                    //                                .padding(.horizontal)
                    //                                // for identifying current index....
                    //                                .tag(index)
                    //
                    //                        })
                    //
                    //                    }
                    //                }
                    //                .frame(height: 220)
                    //                .padding(.top,15)
                    //                .tabViewStyle(PageTabViewStyle())
                    //                .animation(.easeOut)
                    
                    // adding custom Grid....
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 8){
                            Text("Companies Recommended for You")
                                .font(.callout)
                                .fontWeight(.bold)
                            
                            Text("Recommendations are based on data score and sentimetal data.")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        
                        Spacer()
                        
                        Button {
                            
                            // reducing to row.....
                            
                            withAnimation(.easeOut){
                                
                                if self.columns.count == 2{
                                    
                                    self.columns.removeLast()
                                }
                                else{
                                    
                                    self.columns.append(GridItem(.flexible(), spacing: 15))
                                }
                            }
                            
                        } label: {
                            
                            Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top,25)
                    
                    LazyVGrid(columns: self.columns,spacing: 25){
                        if let companies = viewModel.company{
                            
                            ForEach(searchText.isEmpty ? companies: viewModel.filteredCompanies(searchText),id: \.Bgei_Score){company in
                                
                                // GridView....
                                
                                GridView(company: company,columns: self.$columns)
                                    .onTapGesture {
                                        
                                        
                                        withAnimation{
                                            
                                            self.showDashBoardView = true
                                            
                                        }
                                        
                                    }
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding([.horizontal,.top])
                    
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Companies")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
        //        .background(Color.black.opacity(0.03).ignoresSafeArea())
    }
}

struct GridView : View {
    
    @State var company: Company
    @Binding var columns : [GridItem]
    @Namespace var namespace
    @State var showDashBoardView : Bool = false
    @State var companyName : String = ""
    var body: some View{
        
        
        VStack{
            
            if self.columns.count == 2{
                
                VStack(spacing: 10){
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        WebImage(url: URL(string:company.logo)!)
                            .resizable()
                            //                            .aspectRatio(contentMode: .fill)
                            .frame( height: 130)
                            .cornerRadius(20)
                        
                        //                            .aspectRatio(contentMode: .fill)
                        
                        
                        
                        //                        Button {
                        //
                        //                        } label: {
                        //
                        //                            Image(systemName: "heart.fill")
                        //                                .foregroundColor(.red)
                        //                                .padding(.all,5)
                        //                                .background(Color.white)
                        //                                .clipShape(Circle())
                        //                        }
                        //                        .padding(.all,5)
                        
                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    //                    .background(Color("bg"))
                    
                    
                    Text(company.Company_Name)
                        .fontWeight(.bold)
                        .foregroundColor(Color("blue"))
                        
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                    
                    
                    Text("Website")
                        .font(.caption)
                        .foregroundColor(Color("blue"))
                        
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                    
                    
                    NavigationLink(
                        destination:  CommentView(company: company)
                            .navigationTitle("")
                            .navigationBarHidden(true),
                        label: {
                            // Daily activity view
                            Text(COMPANY_DETAIL)
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal,25)
                                .background(Color("blue"))
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "score", in: self.namespace)
                            
                        }
                    )
                    
                }
                .padding()
                .background(Color.white)
                
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                //                .cornerRadius(15)
            }
            else{
                
                // Row View....
                
                // adding animation...
                
                HStack(spacing: 30){
                    
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        
                        WebImage(url: URL(string:company.logo)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .frame(height: 150)
                            .cornerRadius(20)
                        
                        
                        //                        Image(game.image)
                        //                            .resizable()
                        //                            .frame(width: (UIScreen.main.bounds.width - 45) / 2,height: 250)
                        //                            .cornerRadius(15)
                        
                        //                        Button {
                        //
                        //                        } label: {
                        //
                        //                            Image(systemName: "heart.fill")
                        //                                .foregroundColor(.red)
                        //                                .padding(.all,10)
                        //                                .background(Color.white)
                        //                                .clipShape(Circle())
                        //                        }
                        //                        .padding(.all,10)
                        
                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(self.company.Company_Name)
                            .fontWeight(.bold)
                            .foregroundColor(Color("blue"))
                            
                            .matchedGeometryEffect(id: "title", in: self.namespace)
                        HStack{
                            Text("Data Score")
                                .font(.caption)
                                .foregroundColor(Color("blue"))
                            //                        .lineLimit(4)
                            Text(String(((self.company.Bgei_Score) * 100).rounded()))
                                .font(.caption)
                                
                                .fontWeight(.bold)
                                
                                .foregroundColor(Color("Color3"))
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                        
                        HStack{
                            Text("Sentimental Score")
                                .font(.caption)
                                .foregroundColor(Color("blue"))
                            //                        .lineLimit(4)
                            Text(String("0.8"))
                                .font(.caption)
                                .fontWeight(.bold)
                                
                                .foregroundColor(Color("ColorPink"))
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                        
                        HStack{
                            
                            NavigationLink(
                                destination: WebView(url: URL(string:company.Website)!)
                                    .navigationTitle(company.Website),
                                
                                label: {
                                    Text("Company Website").font(.caption)
                                        .foregroundColor(.white)
                                    
                                })
                        }
                        // Rating Bar...
                        
                        //                        HStack(spacing: 10){
                        //
                        //                            ForEach(1...5,id: \.self){rating in
                        //
                        //                                Image(systemName: "star.fill")
                        //                                    .foregroundColor(self.game.rating >= rating ? .yellow : .gray)
                        //                            }
                        //
                        //                            Spacer(minLength: 0)
                        //                        }
                        NavigationLink(
                            destination:
                                CommentView(company: self.company)
                                .navigationTitle("")
                                .navigationBarHidden(true),
                            label: {
                                // Daily activity view
                                Text(COMPANY_DETAIL)
                                    .foregroundColor(.white)
                                    .padding(.vertical,10)
                                    .padding(.horizontal,25)
                                    .background(Color("blue"))
                                    .cornerRadius(10)
                                    .padding(.top,-5)
                                    .matchedGeometryEffect(id: "score", in: self.namespace)
                                
                            }
                        )
                        //                        Button {
                        //                            self.showDashBoardView = true
                        //                            self.companyName = self.company.Company_Name
                        //                        } label: {
                        //
                        //                            Text("View Score")
                        //                                .foregroundColor(.white)
                        //                                .padding(.vertical,10)
                        //                                .padding(.horizontal,15)
                        //                                .background(Color("color4"))
                        //                                .cornerRadius(10)
                        //                        }
                        //                        .padding(.top,5)
                        //                        .matchedGeometryEffect(id: "score", in: self.namespace)
                    }
                    
                    //                    .sheet(isPresented: self.$showDashBoardView){
                    //                        CommentView(company: self.company)
                    //                    }
                }
                
                .padding(.horizontal, 25)
                .padding(.vertical, 5)
                .background(Color.white)
                
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                
            }
            
        }
        //        .sheet(isPresented: self.$showDashBoardView){
        //
        //            CommentView(company: self.$company, show: self.$showDashBoardView)
        //        }
        
        
    }
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

