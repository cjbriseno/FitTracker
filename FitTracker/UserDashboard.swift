//
//  UserDashboard.swift
//  FitTracker
//
//  Created by Cris Briseno on 12/3/23.
//

import SwiftUI

// use this color scheme
let Orange = Color(red: 231 / 255.0, green: 111 / 255.0, blue: 81 / 255.0)
let Brown = Color(red: 244 / 255.0, green: 162 / 255.0, blue: 97 / 255.0)
let Yellow = Color(red: 233 / 255.0, green: 196 / 255.0, blue: 106 / 255.0)
let Green1 = Color(red: 42 / 255.0, green: 157 / 255.0, blue: 143 / 255.0)
let Green2 = Color(red: 40 / 255.0, green: 114 / 255.0, blue: 113 / 255.0)
let Blue = Color(red: 38 / 255.0, green: 70 / 255.0, blue: 83 / 255.0)


// this is circle progress bar
struct CircularProgressBar: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0) // Adjust the thickness of the circle
                .opacity(0.3)
                .foregroundColor(.white)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Orange) // Adjust the color of the progress

            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                .font(.headline)
                .foregroundColor(Orange) // Adjust the color of the percentage text
        }
    }
}

// this is page layout
struct UserDashboard: View {
    @State private var loggedCalories: Double = 1000
    let goalCalories: Double = 3000
    @State private var loggedProtien: Double = 100
    let goalProtien: Double = 200
    
    var body: some View {
        ZStack {
            Blue.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                CircularProgressBar(progress: loggedCalories / goalCalories)
                    .frame(width: 150, height: 150)
                Text("Calories")
                    .foregroundColor(.white)
                
                CircularProgressBar(progress: loggedProtien / goalProtien)
                    .frame(width: 150, height: 150)
                Text("Protien")
                    .foregroundColor(.white)
                
                    .padding(.bottom, 50)
                
                // button to log food
                Button(action: {}) {
                    Text("Log Food")
                        .font(.system(.title))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50)
                }
                .background(Color(Orange))
                .cornerRadius(50)
                .padding(.bottom, 75)
                
                // to diary
                Button(action: {}) {
                    Text("Diary")
                        .font(.system(.title))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50)
                }
                .background(Color(Orange))
                .cornerRadius(50)
                .padding(.bottom, 75)
                
            }
        }
    }
}

#Preview {
    UserDashboard()
}
