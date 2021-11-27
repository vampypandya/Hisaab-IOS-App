//
//  LoginView.swift
//  Hisaab
//
//  Created by Vishwam Pandya on 11/11/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email:String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            Form {
                Section{
                TextField("EmailID", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                  .autocapitalization(.none)
                                  .disableAutocorrection(true)
                }
                Section{
                SecureField("Password",text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                LargeButton(title: "Log In",
                            backgroundColor: Color.white,
                            foregroundColor: Color.yellow) {
                    print("User clicked Login")
                    
                }.disabled(isLoginDisabled)

            }
        }
        
    }
    private var isLoginDisabled: Bool {
        email.isEmpty || password.isEmpty
      }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
