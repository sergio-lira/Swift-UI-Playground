//
//  StaticGrids.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/20/24.
//
// Content: #grid #shapes #style #staticview

import SwiftUI

struct StaticGridView: View {
    
    @State private var isOn = false
    
    var body: some View {
        Grid(horizontalSpacing: 30, verticalSpacing: 30) {
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.gradient)
                    .frame(width: 100, height: 100)
                    .gridColumnAlignment(.trailing)
                
                VStack {
                    Circle()
                        .foregroundStyle(.primary)
                        .frame(width: 60, height: 60)
                    
                    Text("Circle")
                }
                
                VStack {
                    Button("Button"){
                        //code
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Toggle("Volume", isOn: $isOn)
                        .labelsHidden()
                }
            }
            
            Divider()
            
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.red.gradient)
                    .frame(height: 100)
                    .gridCellColumns(3)
            }
        }
        .padding()
    }
}

#Preview {
    StaticGridView()
}
