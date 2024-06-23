//
//  BarChartView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/22/24.
//
// Content: #charts #barChart #UI #extension #interface
// URL: https://youtu.be/4utsyqhnS4g?si=0ww5bvuU9XK246F1 by Sean Allen

import SwiftUI
import Charts

struct BarChartView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Views by Month")
                Text("Total: \(ViewCountMockData.dateData.reduce(0, {$0 + $1.viewCount}))" )
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                
                Chart {
//                    RuleMark(y: .value("Goal", 4500))
//                        .foregroundStyle(.pink)
//                        .lineStyle(StrokeStyle(lineWidth: 1, dash:[5]))
//                        .annotation(alignment: .leading) {
//                            Text("Goal")
//                                .font(.caption)
//                                .foregroundStyle(.secondary)
//                        }
                    
                    ForEach(ViewCountMockData.dateData) { viewMonth in
                        BarMark(x: .value("Month", viewMonth.date, unit: .month),
                                y: .value("View Vount", viewMonth.viewCount))
                    }
                    .foregroundStyle(.gray.gradient)
                }
                .frame(height: 205)
                .chartPlotStyle { plotContent in
                    plotContent.background(.black.gradient.opacity(0.1))
                        .border(.green, width: 1)
                }
                //.chartYScale(domain: 0...200)
                .chartXAxis {
                    AxisMarks(values: ViewCountMockData.dateData.map{$0.date}) {date in
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 1, dash: [2]))
                        AxisTick()
                        AxisValueLabel(format: .dateTime.month(.narrow), centered: true)
                    }
                }
                .chartYAxis{
                    AxisMarks(position: .leading) {
                        AxisValueLabel()
                        AxisGridLine()
                    }
                }
                
                HStack{
                    Image(systemName: "line.diagonal")
                        .rotationEffect(Angle(degrees: 45))
                        .foregroundColor(.mint)
                    
                    Text("Goal")
                        .foregroundStyle(.secondary)
                }
                .font(.caption2)
                .padding(.leading, 5)
            }
            .padding(.bottom, 5)
            
            GroupBox {
                Chart {
                    ForEach(ViewCountMockData.dateData) { viewMonth in
                        LineMark(x: .value("Month", viewMonth.date, unit: .month),
                                y: .value("View Vount", viewMonth.viewCount))
                    }
                    .foregroundStyle(.gray.gradient)
                    RuleMark(y: .value("Goal", 4500))
                }
                .frame(height: 205)
                //.chartXAxis(.hidden)
                .chartYAxis(.hidden)
            }
            
            Chart {
                ForEach(ViewCountMockData.dateData) { viewMonth in
                    BarMark(x: .value("View Vount", viewMonth.viewCount),
                            y: .value("Month", viewMonth.date, unit: .month))
                }
                .foregroundStyle(.gray.gradient)
            }
            .frame(height: 205)
        }
        .padding()
    }
}


struct ViewCountMockData {
    static var dateData: [ViewMonth] = [
        .init(date: Date.from(year: 2024, month: 1, day: 1), viewCount: Int.random(in: 1500...5000)),
        .init(date: Date.from(year: 2024, month: 2, day: 1), viewCount: Int.random(in: 2500...6000)),
        .init(date: Date.from(year: 2024, month: 3, day: 1), viewCount: Int.random(in: 4500...5000)),
        .init(date: Date.from(year: 2024, month: 4, day: 1), viewCount: Int.random(in: 1500...7000)),
        .init(date: Date.from(year: 2024, month: 5, day: 1), viewCount: Int.random(in: 2500...5000)),
        .init(date: Date.from(year: 2024, month: 6, day: 1), viewCount: Int.random(in: 3500...8000)),
        .init(date: Date.from(year: 2024, month: 7, day: 1), viewCount: Int.random(in: 500...5000)),
        .init(date: Date.from(year: 2024, month: 8, day: 1), viewCount: Int.random(in: 1500...9000)),
        .init(date: Date.from(year: 2024, month: 9, day: 1), viewCount: Int.random(in: 2500...7000)),
        .init(date: Date.from(year: 2024, month: 10, day: 1), viewCount: Int.random(in: 4500...5000)),
        .init(date: Date.from(year: 2024, month: 11, day: 1), viewCount: Int.random(in: 3500...4000)),
        .init(date: Date.from(year: 2024, month: 12, day: 1), viewCount: Int.random(in: 1500...5000)),
    ]
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

#Preview {
    BarChartView()
}
