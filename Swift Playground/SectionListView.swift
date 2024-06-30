//
//  SectionListView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/29/24.
//

import SwiftUI

struct SectionListView: View {
    @State private var isBluetoothOn = true
    var body: some View {
        List {
            Section {
                Toggle("Bluetooth",isOn: $isBluetoothOn)
            } footer: {
                Text("This iPhone is discoverable as \"XYZ\" while Bluetooth Settings is open")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.leading, 15)
                    .listRowBackground(Color.clear)
            }
            if isBluetoothOn {
                
                Section {
                    DeviceRow(deviceName: "S9", connectionStatus: "Connected", isKnown: true)
                    DeviceRow(deviceName: "3ANC", connectionStatus: "Not Connected", isKnown: true)
                    DeviceRow(deviceName: "Home Teather", connectionStatus: "Not Connected", isKnown: true)
                    DeviceRow(deviceName: "XYZ device with a very long name that should be cut-off", connectionStatus: "Not Connected", isKnown: true)
                    DeviceRow(deviceName: "My Air Pods Pro 2nd Generation", connectionStatus: "Not Connected", isKnown: true)
                    DeviceRow(deviceName: "Shortname", connectionStatus: "Not Connected", isKnown: true)
                } header: {
                    Text("My Devices")
                }
                
                Section {
                    DeviceRow(deviceName: "Pixel Buds", isKnown: false)
                    DeviceRow(deviceName: "Galaxy Watch", isKnown: false)
                    DeviceRow(deviceName: "MacBook Pro", isKnown: false)
                    DeviceRow(deviceName: "iPad Air", isKnown: false)
                    DeviceRow(deviceName: "Nintendo Switch", isKnown: false)
                    DeviceRow(deviceName: "Beats Studio 3", isKnown: false)
                    DeviceRow(deviceName: "Echo Dot", isKnown: false)
                    DeviceRow(deviceName: "Google Nest", isKnown: false)
                    DeviceRow(deviceName: "Sony WH-1000XM4", isKnown: false)
                    DeviceRow(deviceName: "Bose QuietComfort 35", isKnown: false)
                    DeviceRow(deviceName: "JBL Flip 5", isKnown: false)
                    DeviceRow(deviceName: "Fitbit Versa", isKnown: false)
                    DeviceRow(deviceName: "Garmin Forerunner 945", isKnown: false)
                    DeviceRow(deviceName: "Dyson Pure Cool", isKnown: false)
                    DeviceRow(deviceName: "Logitech MX Master 3", isKnown: false)
                    DeviceRow(deviceName: "Canon EOS R5", isKnown: false)
                    DeviceRow(deviceName: "GoPro HERO9", isKnown: false)
                    DeviceRow(deviceName: "Roku Streaming Stick+", isKnown: false)
                    DeviceRow(deviceName: "Apple TV 4K", isKnown: false)
                    DeviceRow(deviceName: "Microsoft Surface Laptop 4", isKnown: false)
                } header: {
                    Text("Other Devices")
                }
            }
        }
        .animation(.easeInOut, value: isBluetoothOn)
    }
}

struct DeviceRow: View {
    var deviceName: String
    var connectionStatus: String?
    var isKnown: Bool
    
    var body: some View {
        HStack {
            Text(deviceName)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
            if isKnown && connectionStatus != nil {
                Text(connectionStatus!)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Image(systemName: "info.circle")
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    SectionListView()
}
