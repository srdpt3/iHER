//
//  Register.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//


import SwiftUI

struct Register: View {
    @EnvironmentObject var homeData : LoginViewModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18, content: {
            
            Label(
                title: {
                    Text("Please Register")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black) },
                
                icon: {
                    // Back Button...
                    Button(action: {
                        homeData.clearData()
                        // Moving View Back To Login...
                        withAnimation{
                            homeData.gotoRegister.toggle()
                        }
                    }, label: {
                        
                        Image("right")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .rotationEffect(.init(degrees: 180))
                    })
                    .buttonStyle(PlainButtonStyle())
                })
            
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
                    
                    Button(action: {}, label: {
                        Image(systemName: "eye")
                            .foregroundColor(.gray)
                    })
                    .buttonStyle(PlainButtonStyle())
                    ,alignment: .trailing
                )
            
            
            Divider()
            
            Label(
                title: { SecureField("Re-Enter Password", text: $homeData.reEnter)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.gray)

                },
                icon: { Image(systemName: "lock")
                    .frame(width: 30)
                    .foregroundColor(.gray)
                })
            
            
            Divider()
            
        })
        .modifier(LoginViewModifier())
        .overlay(
            
            Button(action: {
                print("Register")
                
                homeData.signup(username: "", email: homeData.email, password: homeData.password, age: "", gender: "", location: "", occupation: "", longitude: "", latitude: "", description: "") { (user) in
                    print("SignUp \(homeData.email)")

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
    
    func signup(username: String, email: String, password: String, age: String, gender: String, location: String, occupation:String,  longitude: String, latitude: String, description: String, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !email.isEmpty && !password.isEmpty {
            //            self.showLoader()
            print("register")
//            AuthService.signupUser(username: username, email: email, password: password, age: age, gender: gender,location: location, occupation: occupation,  longitude: longitude, latitude: latitude, description: description, onSuccess: completed, onError: onError)
        }
        
        
    }
}

struct Resigter_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}


