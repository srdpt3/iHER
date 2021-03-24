//
//  Login.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI


struct Login: View {
    @EnvironmentObject var homeData : LoginViewModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18, content: {
            
            Text("Please Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Label(
                title: { TextField("Enter Email", text: $homeData.email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.gray)
                },
                icon: { Image(systemName: "envelope")
                    .frame(width: 30)
                    .foregroundColor(.gray)
                })
                
            
            Divider()
            
            Label(
                title: { SecureField("Password", text: $homeData.password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.gray)

                },
                icon: { Image(systemName: "lock")
                    .frame(width: 30)
                    .foregroundColor(.gray)
                })
                .overlay(
                
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "eye")
                            .foregroundColor(.gray)
                    })
                    .buttonStyle(PlainButtonStyle())
                    ,alignment: .trailing
                )
                
            
            Divider()
            
            HStack{
                
                Button(action: {}, label: {
                    Text("Forgot details?")
                        .font(.caption)
                        .fontWeight(.bold)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    // Going to register Page...
                    withAnimation{
                        homeData.clearData()
                        homeData.gotoRegister.toggle()
                    }
                }, label: {
                    Text("Create account")
                        .font(.caption)
                        .fontWeight(.bold)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .foregroundColor(.gray)
        })
        .modifier(LoginViewModifier())
        .overlay(
        
            Button(action: {
                
                homeData.signin(email:  homeData.email, password: homeData.password) { (User) in
                    print("login \(homeData.email)")

                } onError: { (errorMessage) in
                    print("Error: \(errorMessage)")
                }

                
            
            }, label: {
                
                Image("right")
                    .renderingMode(.template)
                    .resizable()
                    .modifier(LoginButtonModifier())
            })
            .buttonStyle(PlainButtonStyle())
            .offset(x: -65,y: -10)
            ,alignment: .bottomTrailing
        )
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}


struct LoginViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        
        // For Better And Clean Code....
        return content
            .padding()
            .padding(.bottom,25)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.vertical)
            .padding(.bottom)
            .padding(.horizontal,25)
    }
}


struct LoginButtonModifier: ViewModifier {

    @EnvironmentObject var homeData: LoginViewModel
    
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: .fit)
            .frame(width: homeData.ismacOS ? 16 : 20, height: homeData.ismacOS ? 16 : 20)
            .foregroundColor(.white)
            .padding(12)
            .background(
            
                LinearGradient(gradient: .init(colors: [Color("gradient1"),Color("gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(Circle())
    }
}

