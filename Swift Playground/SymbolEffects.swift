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
    
    let _columns = Array(repeating: GridItem(.flexible()), count: 3)
    @State var symbol = "wifi"
    let symbols = ["wifi", "iphone.gen3.radiowaves.left.and.right", "waveform.path", "rainbow",
                   "shareplay", ""]
    
    @State var discreteAnimation  = 0
    @State var isActive = false
    
    var body: some View {
        ScrollView {
            HStack{
                Text("Current Symbol:")
                Picker("Select Symbol", selection: $symbol) {
                    ForEach(symbols, id: \.self) { symbolName in
                        Text(symbolName).tag(symbolName)
                    }
                }
            }
            
            LazyVGrid(columns: _columns, spacing: 10, pinnedViews: .sectionHeaders) {
                Section {
                    VStack {
                        ResizableImage(systemName: symbol)
                            .symbolEffect(.bounce, value: discreteAnimation)
                        Text(".bounce")
                            .font(.caption.monospaced())
                    }
                    VStack {
                        ResizableImage(systemName: symbol)
                            .symbolEffect(.pulse, value: discreteAnimation)
                        Text(".pulse")
                            .font(.caption.monospaced())
                    }
                    VStack {
                        ResizableImage(systemName: symbol)
                            .symbolEffect(.variableColor, value: discreteAnimation)
                        Text(".variableColor")
                            .font(.caption.monospaced())
                    }
                } header: {
                    Text("Discrete")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Stepper("Count: \(discreteAnimation) ", value: $discreteAnimation)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                
            }
            
            LazyVGrid(columns: _columns, spacing: 10, pinnedViews: .sectionHeaders) {
                Section {
                    VStack {
                        ResizableImage(systemName: symbol)
                            .symbolEffect(.scale.up, isActive: isActive)
                        Text(".scale")
                            .font(.caption.monospaced())
                    }
                    VStack {
                        ResizableImage(systemName: symbol)
                            .symbolEffect(.disappear, isActive: isActive)
                        Text(".dissapear")
                            .font(.caption.monospaced())
                    }
                    VStack {
                        ResizableImage(systemName: isActive ? "wifi": "wifi.slash")
                            .contentTransition(.symbolEffect(.replace))
                        Text(".replace")
                            .font(.caption.monospaced())
                    }
                } header: {
                    Text("State")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Toggle("Active: \(isActive) ", isOn: $isActive)
                }
                
            }
            
            LazyVGrid(columns: _columns, spacing: 0, pinnedViews: .sectionHeaders) {
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
                        .symbolEffect(.bounce, value: discreteAnimation) // Needs to be tied to a state
                        .padding()
                    
                    VStack{
                        ResizableImage(systemName: "antenna.radiowaves.left.and.right")
                            .symbolRenderingMode(.monochrome)
                            .symbolEffect(.variableColor.iterative)
                        Text("Searching...")
                            .font(.caption.monospaced())
                    }.scaleEffect(0.9)
                    
                    VStack{
                        ResizableImage(systemName: "message.badge.waveform")
                            .symbolEffect(.variableColor.iterative)
                        Text("Recording...")
                            .font(.caption.monospaced())
                    }.scaleEffect(0.9)
                    
                } header: {
                    Text("Complex Effects")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
        }
        .padding()
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
