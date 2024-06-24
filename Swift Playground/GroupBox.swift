//
//  GroupBox.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/20/24.
//
// Content: #Zstack #GroupBox #Style #extension #inherit #shapes #progressview
// URL: https://youtu.be/NvE3SaGGurQ?si=lPzsKhnkL_Qy00zw by Sean Allen

import SwiftUI

struct GroupBoxDemo: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.pink.gradient.opacity(0.8))
                .ignoresSafeArea()
            
            VStack(spacing: 20 ) {
                GroupBox ("this is a title") {
                    Text("This is a group box box content")
                }
                .frame(width: 240)
                .groupBoxStyle(.music)
                
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }
                    .groupBoxStyle(.music)
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                }
                .groupBoxStyle(.music)
            }
            .padding()
        }
    }
}


struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading){
            configuration.label
                .bold()
                .fontDesign(.monospaced)
                .foregroundStyle(.pink)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}

struct MusicPlayerView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool Song Title")
                        .font(.headline.bold())
                    
                    Text("Artist Name")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            .padding(.bottom, 8)
            
            ProgressView(value: 0.4, total: 1)
                .tint(.secondary)
                .padding(.bottom, 20)
            
            HStack(spacing: 30) {
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "forward.fill")
            }
            .foregroundStyle(.secondary)
            .font(.title)
        }
    }
}

#Preview {
    GroupBoxDemo()
}
