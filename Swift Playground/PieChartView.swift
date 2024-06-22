//
//  PieChartApp.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/22/24.
//
// Content: #charts #interface #UI #arraySort
// URL: https://youtu.be/8M3N4HWUc0U?si=MGnPN-Q29i2b9bez by Sean Allen

import SwiftUI
import Charts

struct PieChartView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(RevenueMockData.revenueStreams.sorted(by: {$0.value < $1.value})) { stream in
                        SectorMark(angle: .value("Stream", stream.value),
                                   // creates a donut chart
                                   //innerRadius: .ratio(0.618),
                                   // Used to highight some section
                                   // outerRadius: stream.name == "Sponsors" ? 180: 120,
                                   angularInset: 1.0)
                        // To have each part with a custon color, one color = single color
                        .foregroundStyle(stream.color)
                        // round the edges
                        .cornerRadius(6)
                        // annotations might not work for pie charts but w/e:
                        .annotation(position: .overlay) {
                            Text("$\(Int(stream.value))")
                                .bold()
                                .foregroundStyle(.white)
                        }
    //                    SectorMark(angle: .value("Stream", stream.value), angularInset: 2)
    //                        .foregroundStyle(by: .value("Name", stream.name))
                    }
                }
                .chartLegend(.hidden)
                .frame(width: 300, height: 300)
            }
            .padding()
            .navigationTitle("Revenue")
            
            Spacer()
        }
    }
}

#Preview {
    PieChartView()
}


struct RevenuaStream: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    let color: Color
}

struct RevenueMockData {
    static var revenueStreams: [RevenuaStream] = [
        .init(name: "Adsense", value: 806, color: .teal),
        .init(name: "Courses", value: 17855, color: .pink),
        .init(name: "Sponsors", value: 4000, color: .indigo),
        .init(name: "Consoulting", value: 2500, color: .brown)
    ]
}
