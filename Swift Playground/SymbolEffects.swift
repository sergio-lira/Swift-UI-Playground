//
//  StaticGrids.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/20/24.
//
//  Content: #grid #shapes #style #symbols #animations
//  URL: https://sarunw.com/posts/animate-sf-symbols-with-symboleffect/

import SwiftUI

struct SymbolEffectsView: View {
    
    let _columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: _columns, spacing: 10, pinnedViews: .sectionHeaders) {
                Section {
                    ResizableImage(systemName: "rainbow")
                        .symbolRenderingMode(.multicolor)
                        .symbolEffect(.variableColor)
                    
                    ResizableImage(systemName: "shareplay")
                        .symbolRenderingMode(.monochrome)
                        .symbolEffect(.variableColor.iterative.hideInactiveLayers)
                    
                    Image(systemName: "cloud.snow.fill")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.gray, Color.blue)
                        .symbolEffect(.pulse.byLayer)
                        .padding()
                    
                    Image(systemName: "cloud.sun.rain.fill")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .yellow, .blue)
                        .symbolEffect(.bounce, value: 5) // Needs to be tied to a state
                        .padding()
                    
                    VStack{
                        ResizableImage(systemName: "antenna.radiowaves.left.and.right")
                            .symbolRenderingMode(.monochrome)
                            .symbolEffect(.variableColor.iterative)
                        Text("Searching...")
                            .font(.title)
                    }.scaleEffect(0.6)
                    
                    VStack{
                        ResizableImage(systemName: "message.badge.waveform")
                            .symbolEffect(.variableColor.iterative)
                        Text("Recording...")
                            .font(.title)
                    }.scaleEffect(0.6)
                    
                } header: {
                    Text("Symbol Effects")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .padding()
        }
    }
}

struct ResizableImage: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .padding()
    }
}

#Preview {
    SymbolEffectsView()
}
