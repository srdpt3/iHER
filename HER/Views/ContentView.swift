//
//  ContentView.swift
//  HER
//
//  Created by Dustin yang on 3/27/21.
//

import SwiftUI

struct ContentView: View {
    @State var index = "Companies"
    @State var show = false
    
    var body: some View {
        
        ZStack{
            
            (self.show ? Color.black.opacity(0) : Color.white).edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .leading) {
                
                VStack(alignment : .leading,spacing: 25){
                    
                    HStack(spacing: 15){
                        
                        Image("pic")
                            .resizable()
                            .frame(width: 65, height: 65)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Catherine")
                                .fontWeight(.bold)
                            
                            Text("New York , US")
                        }
                    }
                    .padding(.bottom, 50)
                    
                    
                    ForEach(data,id: \.self){i in
                        
                        Button(action: {
                            
                            self.index = i
                            
                            withAnimation(.spring()){
                                
                                self.show.toggle()
                            }
                            
                        }) {
                            
                            HStack{
                                
                                Capsule()
                                    .fill(self.index == i ? Color("companyProfile2") : Color.clear)
                                    .frame(width: 5, height: 30)
                                
                                Text(i)
                                    .padding(.leading)
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                    
                    Spacer()
                }.padding(.leading)
                .padding(.top)
                .scaleEffect(self.show ? 1 : 0)
                
                ZStack(alignment: .topTrailing) {
                    
                    MainContentView(show: self.$show,index: self.$index)
                        .scaleEffect(self.show ? 0.8 : 1)
                        .offset(x: self.show ? 150 : 0,y : self.show ? 50 : 0)
                        .disabled(self.show ? true : false)
                    
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                        
                    }.padding()
                    
                    .opacity(self.show ? 1 : 0)
                }
                
            }
        }
    }
}

struct MainContentView : View {
    
    @Binding var show : Bool
    @Binding var index : String
    @StateObject var obs = Observer()
//    @StateObject var streamData = StreamViewModel()
    @AppStorage("log_Status") var logStatus = false
    var body : some View{
            
        VStack(spacing: 0){
            
            ZStack{
                
                HStack{
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        Image("Menu")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("menudot")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                    }
                }
                
                                Text("iHER")
                                    .fontWeight(.bold)
                                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            ZStack{
                
                //                CompanyView()
                CompanyView()
                    .environmentObject(obs)
                    .opacity(self.index == "Companies" ? 1 : 0)

                MyCompanyView().environmentObject(obs).opacity(self.index == "My Company" ? 1 : 0)
                
//                NewsView().opacity(self.index == "Headline" ? 1 : 0)
                

                Home().opacity(self.index == "Home" ? 1 : 0)
                
                Settings().opacity(self.index == "Settings" ? 1 : 0)
                
            }
            
        }
        //        .background(Color.black.opacity(0.03))
        .onAppear(){
            //                AuthService.logout()
            self.obs.getCompanyList()
        }
        .cornerRadius(15)
        //        .background(Color.black.opacity(0.03).ignoresSafeArea())
    }
}



struct Settings : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Settings")
            }
        }
    }
}



var data = ["Companies","My Company","Home","Settings"]
