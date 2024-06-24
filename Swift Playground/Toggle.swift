//
//  Toggle.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/5/24.
//
//  Content: #toggle #form #transition #style
//  URL: https://youtu.be/-sw7gvNUboc?si=MnYXAvbnnzHleMFl by Sean Allen

import Foundation
import SwiftUI

struct ToggleView: View {
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
    ToggleView()
}
