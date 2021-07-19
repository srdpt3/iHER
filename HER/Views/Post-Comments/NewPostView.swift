//
//  NewPost.swift
//  HER
//
//  Created by Dustin yang on 7/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewPostView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    
    @ObservedObject var viewModel : UploadPostViewModel
    
    
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
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
        }.padding()
        
        HStack(alignment: .top) {
//            KFImage(viewModel.profileImageUrl)
            if let user = AuthViewModel.shared.user{
                Image("p0")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
            }
         
//            Text("What's happening??").foregroundColor(.gray)
            TextArea("What's happening", text: $captionText)
            
            Spacer()
        }.padding()
        Spacer()
        
        
    }
}

