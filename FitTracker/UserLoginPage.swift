//
//  UserLoginPage.swift
//  FitTracker
//
//  Created by Cris Briseno on 12/3/23.
//

import SwiftUI

struct UserLoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red:160/255, green: 11/255, blue: 32/255))
                .frame(width: 300, height: 300)
                .position(x: 100, y: 40)
        
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 250, height: 50)
                .foregroundColor(Color.white)
            Text("FitTracker")
                .font(.system(.largeTitle, design: .monospaced))
                .fontWeight(.semibold)
            
        }
        
        VStack(alignment: .center) {
            Text("Welcome!")
                .font(.system(.largeTitle, design: .monospaced))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Login")
                .font(.system(.largeTitle, design: .monospaced))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 50.0)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 50) .stroke(Color(red:160/255, green: 11/255, blue: 32/255)))
                .padding(.bottom, 10)
                        
            TextField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 50) .stroke(Color(red:160/255, green: 11/255, blue: 32/255)))
                .padding(.top, 10)
                .padding(.bottom, 40)
            
            Button(action: {}) {
                Text("Sign In")
                    .font(.system(.title, design: .monospaced))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 150, height: 50)
            }
            .background(Color(red: 160/255, green: 11/255, blue: 32/255))
            .cornerRadius(50)
            .padding(.bottom, 75)
            
            // needs to be link
            Text("Forgot Password?")
                .font(.system(.body, design: .monospaced))
                .padding(.bottom, 30)
                .underline()
            
            // needs to be link
            Text("Create Account")
                .font(.system(.body, design: .monospaced))
                .underline()
            
        }
        .padding()
    }
}

#Preview {
    UserLoginPage()
}
