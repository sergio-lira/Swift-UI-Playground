//
//  ExpandingViews.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 7/1/24.
//
//  Content: #list #animation #effect #mask #matchedGeometry #ViewBuilder #namespace
//  URL: https://github.com/Mobile-Apps-Academy/ExpandableViewSwiftUI/blob/main/ContentView.swift

import SwiftUI

struct ExpandingViews: View {
    var body: some View {
        
        ScrollView {
            VStack(spacing: 5) {
                ForEach(0..<15) { i in
                    ExpandableView(minimizedView: {
                        VStack(spacing: 12) {
                            Text("This is the title of entry \(i)")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Reading time: \(Int.random(in: 1...54)) minutes")
                                .font(.footnote)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(5)
                    }, expandedView: {
                        VStack(spacing: 12) {
                            Text("This is the title of entry \(i)")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Reading time: \(Int.random(in: 1...54)) minutes")
                                .font(.footnote)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            
                            Spacer()
                        }
                        .padding(5)
                    })
                }
            }
        }
        .padding()
    }
}


struct ExpandableView<Minimized: View, Expanded: View>: View {
    @Namespace private var namespace
    
    let id = UUID()
    @State private var show = false
    
    var minimizedView: () -> Minimized
    var expandedView: () -> Expanded
    
    var backgroundColor: Color = .gray
    var cornerRadious =  5.0
    
    var body: some View {
        ZStack {
            if !show {
                minimizedView()
                    .matchedGeometryEffect(id: "content", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            } else {
                expandedView()
                    .matchedGeometryEffect(id: "content", in: namespace)
                Button {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
        }
        .padding()
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
        .background(
            backgroundColor.matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: cornerRadious, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
    }
}

#Preview {
    ExpandingViews()
}
