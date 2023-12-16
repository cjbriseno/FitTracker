//
//  ConfirmationPage.swift
//  FitTracker
//
//  Created by Oscar Hernandez on 12/7/23.
//
// ConfirmationView.swift
import Foundation
import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        ZStack {

            VStack {
                Text("You're all set! Let's get to journaling your grub.")
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                    .padding()

                NavigationLink(destination: UserDashboard()) {
                    Text("Ok")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.16, green: 0.62, blue: 0.56))
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding(20)
            .navigationBarTitle("", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
            
        }
        
        
    }
    
}
