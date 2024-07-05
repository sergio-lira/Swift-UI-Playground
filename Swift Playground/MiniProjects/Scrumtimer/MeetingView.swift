//
//  MeetingView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 7/4/24.
//
//  Content: #progressView #label #image #circle #appleTutorial
//  URL: https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 75, total: 100)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            Circle()
                .strokeBorder(lineWidth: 20)
            
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
