//
//  UserDashboard.swift
//  FitTracker
//
//  Created by Cris Briseno on 12/3/23.
//

import SwiftUI
import Charts

// maybe: create donutchart as a template
/*struct DonutChart: View {
    // this is the data
    let data = [(name: String, total: Int)]()
    
    var body: some View {
        VStack {
            // actual chart
            Chart(data, id: \.name) { element in
                SectorMark(
                    angle: .value("Calories", element.total),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Name", element.name))
            }
            // text in chart
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    let frame = geometry[chartProxy.plotAreaFrame]
                    VStack {
                        Text("CALORIES")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .position(x: frame.midX, y: frame.midY)
                    
                }
                
            }
        }
        //.frame(width: 200, height: 200)
    }
}*/

struct UserDashboard: View {
    var body: some View {
        
        // calories
        VStack {
            let data = [
                (name: "CALORIES", total: 2000),
                (name: "CALORIE GOAL", total: 3000)
            ]
            Chart(data, id: \.name) { element in
                SectorMark(
                    angle: .value("Calories", element.total),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Name", element.name))
            }
            // text in chart
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    let frame = geometry[chartProxy.plotAreaFrame]
                    VStack {
                        Text("CALORIES")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .position(x: frame.midX, y: frame.midY)
                    
                }
                
            }
        }
        .frame(width: 200, height: 200)
        
        // protien
        VStack {
            let data = [
                (name: "PROTIEN", total: 75),
                (name: "PROTIEN GOAL", total: 300)
            ]
            Chart(data, id: \.name) { element in
                SectorMark(
                    angle: .value("Calories", element.total),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Name", element.name))
            }
            // text in chart
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    let frame = geometry[chartProxy.plotAreaFrame]
                    VStack {
                        Text("PROTIEN")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .position(x: frame.midX, y: frame.midY)
                    
                }
                
            }
        }
        .frame(width: 200, height: 200)
        
        .padding()
        
        // button to begin tracking
        Button(action: {}) {
            Text("Log Food")
                .font(.system(.title, design: .monospaced))
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(width: 150, height: 50)
        }
        .background(Color(red: 160/255, green: 11/255, blue: 32/255))
        .cornerRadius(50)
        .padding(.bottom, 75)

        // buttons
        Button(action: {}) {
            Text("Diary")
                .font(.system(.title, design: .monospaced))
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(width: 150, height: 50)
        }
        .background(Color(red: 160/255, green: 11/255, blue: 32/255))
        .cornerRadius(50)
        .padding(.bottom, 75)
        
        }
    }

#Preview {
    UserDashboard()
}
