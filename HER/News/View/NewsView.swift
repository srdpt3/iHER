//
//  NewsView.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
//    let news : [News] = Bundle.main.decode("test.json")
    
    @ObservedObject var list = getData()
    var body: some View {
        NavigationView{
            List(list.datas) { i in
                
                NavigationLink(
                    destination: WebView(url: URL(string:i.url)!)
                        .navigationTitle(""),
                    
                    label: {
                        HStack(spacing: 15){
                            VStack(alignment: .leading, spacing: 10){
                                Text(i.title).fontWeight(.heavy)
                                Text(i.desc).lineLimit(2)
                            }
                            Spacer()
                            if i.image != "" {
                                
                   
                                
                                WebImage(url: URL(string:i.image)! , options: .highPriority, context: nil)
                                    .resizable()
        //                            .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(20)
                            }

                        }.padding(.vertical, 15)

                    })
                
                
                

                
            
            }.navigationBarHidden(true).navigationTitle("").ignoresSafeArea()
        }
//        .navigationBarHidden(true).navigationTitle("").ignoresSafeArea()
//
//        TabView{
//            ForEach(news) { item in
//                print(item)
//            }
//
//        }.tabViewStyle(PageTabViewStyle())
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}
