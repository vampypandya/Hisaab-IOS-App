//
//  SignupView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 11/11/21.
//

import SwiftUI

struct SignupView: View {
    @State private var email:String = ""
    @State private var password: String = ""
    @State private var displayEmailField = true
    @State private var displayPasswordField = false
    
    var body: some View {
        NavigationView {
            VStack{
                if displayEmailField{
                    HStack{
                        TextField("Email Id", text: $email).underlineTextField()
                        Button(action: {displayPasswordField = true; displayEmailField = false}, label: {
                            Image(systemName: "arrow.forward.square.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.yellow)
                            
                        })
                    }
                    .padding()
                }
                
                if displayPasswordField {
                    HStack{
                        SecureField("Password",text: $password).underlineTextField()
                        Button(action: {displayPasswordField = true; displayEmailField = false}, label: {
                            Image(systemName: "paperplane.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.yellow)
                        })
                    }.padding()
                    }
                }
            }
        }
    }


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.yellow)
            .padding(10)
    }
}
