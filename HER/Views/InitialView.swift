//
//  InitialView.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI
import Foundation
enum ActiveAlert {
    case first, second, third
}

struct InitialView: View {
    
//    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var obs : Observer
    @State var noConnection : Bool = false
    @State var showSplash = true

    func listen() {
        //        self.obs.reload()
        
        if(Reachabilty.HasConnection()){
//            self.obs.isReloading = true
             obs.listenAuthenticationState()
            self.noConnection = false
        }else{ 
            self.noConnection = true
        }
        
    }
    
    var body: some View {
        NavigationView{
            ZStack{

              if(!LandingView.shouldAnimate){
                    if(self.obs.isLoggedIn){
                        MainView().background(Color("bg"))

//

                    }else{
//                        MainView().background(Color("bg"))

                       Home()
                    }

            }

                LandingView()
                    .opacity(showSplash ? 1 : 0)


                    .onAppear {
                        AuthService.logout()

                        self.listen()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            LandingView.shouldAnimate = false
                            withAnimation(Animation.easeIn(duration: 1)) {
                                self.showSplash = false
                            }
                        }
                }
            
            }
        }

     

      

        
        
        
        //
        //        .onAppear(perform: listen).alert(isPresented: $noConnection) {
        //            Alert(
//                title: Text(ERROR),
//                message: Text(NO_CONNECTION),
//                dismissButton: .default(Text(CONFIRM)))
//
//
//
//
//        }
    }
}

