//
//  Toggle.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/5/24.
//
//  Content: #toggle #form #transition #style

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var isWifiOn = false
    var body: some View {
        VStack{
            Toggle("Wi-Fi", systemImage: "wifi",isOn: $isWifiOn)
                .tint(.pink)
                .toggleStyle(.button)
            
            Toggle("Wi-Fi", systemImage: isWifiOn ? "wifi" : "wifi.slash",isOn: $isWifiOn)
                .tint(.pink)
                .toggleStyle(.button)
                .labelStyle(.iconOnly)
                .contentTransition(.symbolEffect)
            
            Form {
                Toggle("Wi-Fi", systemImage: "wifi", isOn: $isWifiOn)
                Toggle("Wi-Fi", isOn: $isWifiOn).tint(.pink)
                Toggle("Wi-Fi", isOn: $isWifiOn).tint(.yellow)
            }
            .padding()
        }.padding()
    }
}

#Preview {
    ContentView()
}
