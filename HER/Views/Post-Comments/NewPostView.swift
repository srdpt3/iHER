//
//  NewPost.swift
//  HER
//
//  Created by Dustin yang on 7/5/21.
//

import SwiftUI
import SDWebImageSwiftUI
import NaturalLanguage

struct NewPostView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    private var sentiment: String {
        return performSentimentAnalysis(for: captionText)
    }
    @ObservedObject var viewModel : UploadPostViewModel
    private let tagger = NLTagger(tagSchemes: [.sentimentScore])

    
    init(isPresented : Binding<Bool>){
        self._isPresented = isPresented
        self.viewModel = UploadPostViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        HStack {
            Button(action: { isPresented.toggle() }, label: {
                Text("Cancel")
                    .foregroundColor(.blue)
            })
            Spacer()
            
            Button(action: {
                viewModel.uploadPost(caption: captionText)
            }, label: {
                Text("Post")
                    .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color("blue"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
        }.padding()
        
        HStack(alignment: .top) {
            
            VStack(alignment: .leading){
                if let user = AuthViewModel.shared.user{
                    WebImage(url: URL(string:"https://companiesmarketcap.com/img/company-logos/256/UBER.png")!)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                }
                

            }
//            KFImage(viewModel.profileImageUrl)

         
//            Text("What's happening??").foregroundColor(.gray)
            TextArea("What's happening", text: $captionText)
            
            Spacer()
        }.padding()
        HStack(alignment: .bottom){
            image(for: sentiment)?.resizable().frame(width: 30, height: 30)
                .animation(.default)
            
            Text("Sentimental score:  \(sentiment)")
                .foregroundColor(color(for: sentiment))
                .multilineTextAlignment(.center)
                .animation(.default)
        }
        Spacer()
        
        
    }
    
    
    private func image(for sentiment: String) -> Image? {
        guard let value = Double(sentiment) else {
            return nil
        }
        
        if value > 0.5 {
            return Image("happy")
        } else if value >= 0 {
            return Image("positive")
        } else if value > -0.5 {
            return Image("worried")
        } else {
            return Image("crying")
        }
        
    }
    
    private func performSentimentAnalysis(for string: String) -> String {
        tagger.string = string
        let (sentiment, _) = tagger.tag(at: string.startIndex,
                                        unit: .paragraph,
                                        scheme: .sentimentScore)
        return sentiment?.rawValue ?? ""
    }
    
    private func color(for sentiment: String) -> Color {
        guard let value = Double(sentiment) else {
            return Color.black
        }
        
        if value > 0 {
            return Color.green
        } else if value < 0 {
            return Color.red
        } else {
            return Color.black
        }
        
    }
}

