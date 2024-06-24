//
//  TipKitView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/23/24.
//
//  Content: #ui #
//  URL:


// Tips should be used for:
// https://developer.apple.com/design/human-interface-guidelines/offering-help
// https://developer.apple.com/videos/play/wwdc2023/10229/
// 1 - Teach about a new feature
// 2 - Help discover a 'hidden' feautre
// 3 - Teach about a new/fast way of accomplish something.

// Do not Use for:
// 1 - Promotional
// 2 - Long form content
// 3 - Error Messaging / Non-actional information

import SwiftUI
import TipKit


// Tips need to be set-up at application start up, see Swift_PlaygroundApp
struct TipKitView: View {
    
    @State private var colorData = TipKitMockData()
    let addColorTip = AddColorTip()
    let favoriteTip = SetFavoriteColorTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                GroupBox {
                    Text("Favs: \(SetFavoriteColorTip.setFavoriteEvent.donations.count) Views: \(SetFavoriteColorTip.colorsViewVisisted.donations.count)")
                } label: {
                    Text("Debug console")
                        .fontDesign(.monospaced)
                        .foregroundStyle(.pink)
                }
                
                TipView(favoriteTip)
                    .tipBackground(.teal.opacity(0.2))
                ForEach (colorData.colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color.gradient)
                        .frame(height: 80)
                        .contextMenu {
                            Button("Favorite", systemImage: "star"){
                                // my code
                                Task { await SetFavoriteColorTip.setFavoriteEvent.donate() }
                            }
                        }
                }
            }
            .onAppear {
                Task { await SetFavoriteColorTip.colorsViewVisisted.donate() }
            }
            .padding()
            .navigationTitle("Colors")
            .toolbar {
                Button {
                    colorData.colors.insert(.random, at: 0)
                    addColorTip.invalidate(reason: .actionPerformed)
                } label: {
                    Image(systemName: "plus")
                }
                .popoverTip(addColorTip)
            }
        }
    }
}

struct TipKitMockData {
    var colors: [Color]
    init() {
        colors =  (0...5).map { _ in Color.random}
    }
}

struct AddColorTip: Tip {
    var title: Text {
        Text("Add new color")
    }
    
    var message: Text? {
        Text ("Tap here to add a new color to the list")
    }
    
    var image: Image? {
        Image(systemName: "paintpalette")
    }
}

struct SetFavoriteColorTip: Tip {
    static let setFavoriteEvent = Event(id: "setFavorite")
    static let colorsViewVisisted = Event(id: "colorsViewVisited")
    
    var title: Text {
        Text("Set Favorites")
    }
    
    var message: Text? {
        Text ("Tap here to add a new color to the list")
    }
    
    var rules: [Rule] {
        #Rule(Self.setFavoriteEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(Self.colorsViewVisisted) { event in
            event.donations.count > 2
        }
    }
}

#Preview {
    TipKitView()   
        // This is usually done in the base view of the application
        // doing it here to generate the tip in preview
        .task {
            // for debugging
            try? Tips.resetDatastore()
            try? Tips.configure([
            //using immedaite to force that the tips are shown constantly
            .displayFrequency(.immediate),
            .datastoreLocation(.applicationDefault)
        ])
    }
}
