//
//  CreateAccountPage.swift
//  FitTracker
//
//  Created by the FitTracker Team
//
// 

import Foundation
import SwiftUI

class CreateAccountViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var selectedActivityIndex = 0
    
    let activityRangeOptions = ["Normie", "Chubs", "Swole"]

    func createAccount() {
        // Implement your account creation logic here
        // You can access the entered values using the properties of this ViewModel
        print("Username: \(username)")
        print("Password: \(password)")
        print("Email: \(email)")
        print("Birthday: \(birthday)")
        print("Selected Body Type: \(activityRangeOptions[selectedActivityIndex])")
    }
}

struct CreateAccountPage: View {
    @StateObject private var viewModel = CreateAccountViewModel()
    @State private var confirmationViewIsActive = false
    

    var body: some View {
        NavigationView {
            ZStack {
                PolygonBackground()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Create Account")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 40)
                    
                    Text("Complete the Following:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Birthday:")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        DatePicker("", selection: $viewModel.birthday, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .foregroundColor(.white)
                    }
                    
                    Text("Select Your Current Body Type:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Picker("Activity Range", selection: $viewModel.selectedActivityIndex) {
                        ForEach(Array(0..<viewModel.activityRangeOptions.count), id: \.self) { index in
                            Text(viewModel.activityRangeOptions[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {
                        viewModel.createAccount()
                        confirmationViewIsActive = true
                    }) {
                        Text("Create Account")
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
                
                
            }
            .edgesIgnoringSafeArea(.all)
            .background(
                NavigationLink(
                    destination: ConfirmationView(),
                    isActive: $confirmationViewIsActive
                ) {
                    EmptyView()
                }
                    .hidden()
            )
        }
        .environmentObject(viewModel)
        .navigationBarBackButtonHidden(true)
    }
    
}

struct PolygonBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
            }
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.16, green: 0.45, blue: 0.44),
                                            Color(red: 0.96, green: 0.64, blue: 0.38)]), // Blue
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))

        }
    }
}

struct CreateAccountPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountPage()
    }
}
