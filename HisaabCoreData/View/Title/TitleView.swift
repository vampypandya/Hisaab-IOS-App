//
//  TitleView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 11/11/21.
//

import SwiftUI

struct TitleView: View {
    @EnvironmentObject var authenticator: Authenticator
    
    @State private var loginPageView = false
    @State private var signUpPageView = false
    var body: some View {
//        Color.yellow.ignoresSafeArea()
        NavigationView{
            VStack {
                NavigationLink(destination: LoginView()
                                .navigationBarBackButtonHidden(true)
                                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {loginPageView = false}, label: {
                            Image(systemName: "xmark.circle.fill").renderingMode(.original)

                        })
                    }
                }, isActive: $loginPageView) {
                    LargeButton(title: "Log In",
                                backgroundColor: Color.white,
                                foregroundColor: Color.yellow) {
                        print("User clicked Login")
                        loginPageView = true
                    }
                }
                NavigationLink(destination: SignupView()
                                .navigationBarBackButtonHidden(true)
                                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {signUpPageView = false}, label: {
                            Image(systemName: "xmark.circle.fill").renderingMode(.original)

                        })
                    }
                }, isActive: $signUpPageView) {
                    LargeButton(title: "Sign Up",
                                backgroundColor: Color.white,
                                foregroundColor: Color.yellow) {
                        print("User clicked SignUp")
                        signUpPageView = true
                    }
                }
            }
            .buttonStyle(BlueButton())
//            .foregroundColor(Color.white)
//            .background(Color.yellow.ignoresSafeArea())
        }.navigationTitle("Navigation")
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal, 50)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 2)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal, 50)
            )
    }
}
