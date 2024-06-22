//
//  Grids.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/20/24.
//
// Content: #lazygrid #responsive #section #header #loops #extension #UiKit

import SwiftUI

struct LazyGridView: View {
    
    let _columns = Array(repeating: GridItem(.flexible(minimum: 20)), count: 3)
    let _columnsSpaced = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 50), count: 3)
    let _fixedColumns = Array(repeating: GridItem(.fixed(100)), count: 3)
    let _adaptiveColumns = [GridItem(.adaptive(minimum: 60))]
    
    let _rows = Array(repeating: GridItem(.fixed(100)), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: _columns, spacing: 10, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(MockData.colors, id: \.self) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0)
                            .frame(height: 100)
                    }
                } header: {
                    Text("Favorities")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Section {
                    ForEach(MockData.colors, id: \.self) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0)
                            .frame(height: 100)
                    }
                } header: {
                    Text("Don't Like")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        
        ScrollView(.horizontal){
            LazyHGrid(rows: _rows) {
                Section {
                    ForEach(MockData.colors, id: \.self) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0)
                            .frame(width: 100)
                    }
                } header: {
                    RotatedText(text: "Horizontal Grid")
                        .padding(-20)
                }
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1))
    }
}

struct MockData {
    static var colors: [Color] {
        var array: [Color] = []
        for _ in 0..<30 { array.append(Color.random)}
        return array
    }
}

struct RotatedText: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
        label.transform = CGAffineTransform(rotationAngle: .pi / 2)
        label.textAlignment = .center
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}

#Preview {
    LazyGridView()
}
