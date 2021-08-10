//
//  CommentView.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentView: View {
    private let company : Company
    //    @Binding var show : Bool
    @Environment(\.presentationMode) var presentation
    @ObservedObject private var viewModel: CompanyViewModel
    @State private var selectedFilter: PostFilterOptions = .post
    @State private var editProfilePresented = false
    @State var currentTab = "Post"
    
    // For Smooth Slide Animation...
    @Namespace var animation
    @State var tabBarOffset: CGFloat = 0
    
    @State var titleOffset: CGFloat = 0
    @Environment(\.colorScheme) var colorScheme
    @State var offset: CGFloat = 0
    
    init(company: Company) {
        self.company = company
        self.viewModel = CompanyViewModel(company: company)
        viewModel.fetchAllCompanyPosts()
        
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack(spacing: 15){
                
                // Header View...
                GeometryReader{proxy -> AnyView in
                    
                    // Sticky Header...
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        
                        self.offset = minY
                    }
                    
                    return AnyView(
                        
                        ZStack{
                            
                            // Banner...
                            WebImage(url: URL(string:company.logo)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width, height: minY > 0 ? 180 + minY : 180, alignment: .center)
                                .cornerRadius(0)
                            
                            BlurView()
                                .opacity(blurViewOpacity())
                            
                            // Title View...
                            VStack(spacing: 5){
                                
                                Text(company.Company_Name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(viewModel.userPosts.count) Post")
                                    .foregroundColor(.white)
                            }
                            // to slide from bottom added extra 60..
                            .offset(y: 120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleTextOffset())
                            .opacity(titleOffset < 100 ? 1 : 0)
                        }
                        .clipped()
                        // Stretchy Header...
                        .frame(height: minY > 0 ? 180 + minY : nil)
                        .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                
                // Profile Image...
                
                VStack{
                    
                    //
                    // Profile Data...
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        CompanyHeaderView(company: company, viewModel: viewModel)

                    })
                    .overlay(

                        GeometryReader{proxy -> Color in

                            let minY = proxy.frame(in: .global).minY

                            DispatchQueue.main.async {
                                self.titleOffset = minY
                            }
                            return Color.clear
                        }
                        .frame(width: 0, height: 0)

                        ,alignment: .top
                    )
                    
                    // Custom Segmented Menu...
                    
                    VStack(spacing: 0){
                        
//                                              ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack(spacing: 10){
                            
                            TabButton2(title: "Post", currentTab: $currentTab, animation: animation)
                            
                            TabButton2(title: "Replies", currentTab: $currentTab, animation: animation)
                            
                            TabButton2(title: "Referral", currentTab: $currentTab, animation: animation)
                            
                        }
//                                            })
                        
                       Divider()
                    }
                    .padding(.top,30)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                    .overlay(
                        
                        GeometryReader{reader -> Color in
                            
                            let minY = reader.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                                self.tabBarOffset = minY
                            }
                            
                            return Color.clear
                        }
                        .frame(width: 0, height: 0)
                        
                        ,alignment: .top
                    )
                    .zIndex(1)
                    
                    VStack(spacing: 18){
                        ForEach(viewModel.posts(forFilter: selectedFilter))  { post in
                          
                            if currentTab ==  "Replies"{
                                ReplyCell(post: post)
                                    .padding()
                            } else {
                                DashboardCell(post: post)
                                    .padding()
                            }
                        }
                    }
                    .padding(.top)
                    .zIndex(0)
                }
                .padding(.horizontal)
                // Moving the view back if it goes > 80...
                .zIndex(-offset > 80 ? 0 : 1)
            }
        })
        .ignoresSafeArea(.all, edges: .top)
        .onAppear(){
            //            viewModel.fetchAllCompanyPosts()
        }
        
    }
    func getTitleTextOffset()->CGFloat{
        
        // some amount of progress for slide effect..
        let progress = 20 / titleOffset
        
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        
        return offset
    }
    
    // Profile Shrinking Effect...
    func getOffset()->CGFloat{
        
        let progress = (-offset / 80) * 20
        
        return progress <= 20 ? progress : 20
    }
    
    func getScale()->CGFloat{
        
        let progress = -offset / 80
        
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        
        // since were scaling the view to 0.8...
        // 1.8 - 1 = 0.8....
        
        return scale < 1 ? scale : 1
    }
    
    func blurViewOpacity()->Double{
        
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
}


// Tab Button...
struct TabButton2: View {
    
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View{
        
        Button(action: {
            withAnimation{
                currentTab = title
            }
        }, label: {
            
            // if i use LazyStack then the text is visible fully in scrollview...
            // may be its a bug...
            LazyVStack(spacing: 12){
                
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? Color("blue") : .gray)
                    .padding(.horizontal)
                
                if currentTab == title{
                    
                    Capsule()
                        .fill(Color.blue)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                else{
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.2)
                }
            }
        })
    }
}
