//
//  SmoothScrollView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/24/24.
//
//  Content: #scrollView #animations #ui
//  URL: https://youtu.be/IwUp2iP0jnI by Sean Allen

import SwiftUI

struct SmoothScrollView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    private let randomColors = TipKitMockData(size: 15)
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(randomColors.colors, id: \.self) { color in
                    Circle()
                      //.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 1: 4,
                                                spacing: 16)
                        .foregroundStyle(color.gradient)
                        .scrollTransition { content, phase in
                            content
                                //Identity phase == view is on screen else entering/exit
                                .opacity(phase.isIdentity ? 1.0 : 0.2)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.5,
                                             y: phase.isIdentity ? 1.0: 0.5)
                                .offset(y: phase.isIdentity ? 0 : 20)
                        }
                }
            }
            .scrollTargetLayout()
        }
        //.contentMargins(.horizontal, for: .scrollContent)
        .contentMargins(16, for: .scrollContent)
        // for a 'paging' behaviour
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    SmoothScrollView()
}
