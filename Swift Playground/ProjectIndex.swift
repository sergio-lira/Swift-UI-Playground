//
//  ProjectIndex.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/23/24.
//

import Foundation

import SwiftUI

struct ProjectIndexView: View {
    let views: [(String, AnyView)] = [
        ("Alert", AnyView(Alerts())),
        ("Toggle", AnyView(ToggleView())),
        ("Empty State", AnyView(EmptyStateView())),
        ("Searchable", AnyView(SearchableView())),
        ("Group Box", AnyView(GroupBoxDemo())),
        ("Lazy Grids", AnyView(LazyGridView())),
        ("Static Grids", AnyView(StaticGridView())),
        ("Pie Charts", AnyView(PieChartView())),
        ("Bar Charts", AnyView(BarChartView())),
        ("Tip Kit Demo", AnyView(TipKitView())),
        ("Animated Scrolling", AnyView(SmoothScrollView())),
        ("Symbol Effects", AnyView(SymbolEffectsView())),
        ("Sectioned List", AnyView(SectionedListView())),
        // Add more views here
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(views.indices, id: \.self) { index in
                    let view = views[index]
                    NavigationLink(destination: view.1) {
                        Text(view.0)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BorderedButtonStyle())
                    .padding(5)
                }
            }
            .navigationTitle("Views")
        }
    }
}

#Preview {
    ProjectIndexView()
}
