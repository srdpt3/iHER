//
//  PostActionsView.swift
//  HER
//
//  Created by Dustin yang on 7/16/21.
//

import SwiftUI

struct PostActionsView: View {
    let post: Post
    @State var isShowingReplyView = false
    @State var isShowingChatview = false
    @State private var animatingModal: Bool = false
    @ObservedObject var viewModel: PostActionViewModel
    @State private var showingModal: Bool = false
    @ObservedObject var textBindingManager = TextBindingManager(limit: 25)

    init(post: Post) {
        self.post = post
        self.viewModel = PostActionViewModel(post: post)
        self.viewModel.getUser(id: post.uid)
    }
    
    var body: some View {
        HStack {
            Button(action: { self.isShowingReplyView.toggle() }, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                
                Text("0")
                    .font(.system(size: 16))
//                frame(width: 32, height: 32)
            }).sheet(isPresented: $isShowingReplyView, content: {
                NewPostView(isPresented: $isShowingReplyView)

//                NewTweetView(isPresented: $isShowingReplyView, tweet: tweet)
            })
            

            Spacer()
            
//            Button(action: {}, label: {
//                Image(systemName: "arrow.2.squarepath")
//                    .font(.system(size: 16))
//                    .frame(width: 32, height: 32)
//            })
            
//            Spacer()
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikePost() : viewModel.likePost()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
                Text(viewModel.didLike ? "like" : "Dislike")
                    .font(.system(size: 16))
            })
            
            Spacer()
            
            
            Button(action: {
               
                if(viewModel.user != nil){
                    self.showingModal.toggle()

                }
            }, label: {
                Image(systemName:  "person.fill.viewfinder")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            .fullScreenCover(isPresented: $showingModal, content: {
                LazyView(UserProfileView(user: viewModel.user!, isPresented: $showingModal))

//                NewTweetView(isPresented: $isShowingReplyView, tweet: tweet)
            })
            

        }
        .foregroundColor(.gray)
        .padding(.horizontal)

//        .sheet(isPresented: $isShowingChatview) {
//            LazyView(UserProfileView(user: viewModel.user!))
////            ChatView(user: viewModel.user!)
//
//        }
//        .blur(radius: self.$showingModal.wrappedValue ? 5 : 0, opaque: false)
//        if self.showingModal {
//            ZStack {
//
//                Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
//
//                // MODAL
//                VStack(spacing: 0) {
//                    // TITLE
//                    Text( "test")
//                        .font(Font.custom(FONT, size: 20))
//                        .fontWeight(.heavy)
//                        .padding()
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .background(APP_THEME_COLOR)
//                        .foregroundColor(Color.white)
//
//                    Spacer()
//
//                    // MESSAGE
//
//                    VStack(spacing: 15) {
//
//                        VStack(spacing: 5){
//                            HStack(alignment: .center, spacing: 5){
//                                Spacer()
//                                Image(systemName: "text.bubble")
//                                    .resizable().frame(width: 15, height: 15).foregroundColor(Color.gray)
//
//
//                                TextField("Message ", text: self.$textBindingManager.text).font(Font.custom(FONT, size: 15))
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(Color.gray)
//                                    .layoutPriority(1)
//
//                            }
//
//                            Text(String(self.textBindingManager.text.count) + " / 25" ) .foregroundColor(Color.gray).font(Font.custom(FONT, size: 10)).padding(.horizontal,20).padding(.top,5)
//
//
//                        } .padding().frame(height: 30)
//                        HStack{
//                            Button(action: {
//                                self.showingModal = false
//                                self.animatingModal = false
//                                //                                         self.presentationMode.wrappedValue.dismiss()
//                                self.textBindingManager.text = ""
//                            }) {
//                                Text(CANCEL.uppercased())
//                                    .font(Font.custom(FONT, size: 15))
//                                    .fontWeight(.semibold)
//                                    .accentColor(Color("Color11"))
//                                    .padding(.horizontal, 55)
//                                    .padding(.vertical, 15)
//                                    .frame(minWidth: 100)
//                                    .background(
//                                        Capsule()
//                                            .strokeBorder(lineWidth: 1.75)
//                                            .foregroundColor(Color("Color11"))
//                                )
//                            }
//                            Button(action: {
//
//                                self.showingModal = false
//                                self.animatingModal = false
//
//
//                            }) {
//                                Text(CONFIRM.uppercased())
//                                    .font(Font.custom(FONT, size: 15))
//                                    .fontWeight(.semibold)
//                                    .accentColor(APP_THEME_COLOR)
//                                    .padding(.horizontal, 55)
//                                    .padding(.vertical, 15)
//                                    .frame(minWidth: 100)
//                                    .background(
//                                        Capsule()
//                                            .strokeBorder(lineWidth: 1.75)
//                                            .foregroundColor(APP_THEME_COLOR)
//                                )
//                            }
//
//                        }
//                    }
//
//                    Spacer()
//
//                }
//                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 320, idealHeight: 340, maxHeight: 380, alignment: .center)
//                .background(Color.white)
//                .cornerRadius(20)
//                .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
//                .opacity(self.$animatingModal.wrappedValue ? 1 : 0)
//                .offset(y: self.$animatingModal.wrappedValue ? 0 : -100)
//                .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
//                .onAppear(perform: {
//                    self.animatingModal = true
//                })
//            }
//
//
//
//        }
    }
}


class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int
    
    init(limit: Int = 5){
        characterLimit = limit
    }
}
