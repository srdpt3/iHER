//
//  News.swift
//  HER
//
//  Created by Dustin yang on 4/10/21.
//

import SwiftUI
import SwiftyJSON

struct News: Codable, Identifiable {
    let id = UUID()
    let status: String
    let totalResults: Int
    let articles : [articles]
}



struct articles: Codable,  Identifiable {
    let id = UUID()
    //    let source : source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
}


struct source: Codable, Identifiable {
    let id: String
    let name: String
}


struct dataType: Codable, Identifiable{
    let id : String
    let title : String
    let desc : String
    let url: String
    let image: String
    
}

class getData: ObservableObject{
    @Published var datas = [dataType]()
    init(){
//        let source = "https://newsapi.org/v2/top-headlines?country=us&apiKey=990a914665a3451e8b666a1cb7fb1e44"
        let source = "https://newsapi.org/v2/everything?q=best+company&sortBy=relevancy&from=2021-04-11&to=2021-04-11&pageSize=30&apiKey=990a914665a3451e8b666a1cb7fb1e44"
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {(data,_,error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            let json = try! JSON(data: data!)
            
            DispatchQueue.main.async {
                for i in json["articles"]{
                    let title = i.1["title"].stringValue
                    let description = i.1["description"].stringValue
                    let url = i.1["url"].stringValue
                    let image = i.1["urlToImage"].stringValue
                    let id = i.1["publishedAt"].stringValue
                    self.datas.append(dataType(id: id, title: title, desc: description, url: url, image: image))
                    
                }
            }
        
            
        }.resume()
        
        
        
    }
}



struct Animal: Codable, Identifiable{
    let id : String
    let name : String
    let headline : String
    let description: String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
}
