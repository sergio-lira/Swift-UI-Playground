//
//  Empty State.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/16/24.
//
// Content: #search #nativation #overlay
// URL: https://youtu.be/bEB7ATENue0?si=bxEB5jj-2o4rKOv9 by Sean Allen

import SwiftUI

struct EmptyState: View {
    
    @State private var heroes = ["Roland", "Jacke", "Callahan", "Eddie", "King", "Oy"]
    @State private var manualInput = []
    @State private var searchTerm = ""
    
    var filteredHeroes: [String] {
        guard !searchTerm.isEmpty else {return heroes}
        return heroes.filter { $0.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                if heroes.isEmpty {
                    ContentUnavailableView("No Heroes",
                                           systemImage: "person.slash",
                                           description: Text("add a hero to see it here"))
//                    ContentUnavailableView(label: {
//                        VStack {
//                            Image(uiImage: .add)
//                                .clipShape(.circle)
//                            Text("No Heroes")
//                                .bold()
//                        }
//                    }, description: {
//                        Text(" Tap the button to add a hero")
//                            .italic()
//                            .foregroundStyle(.teal)
//                    }, actions: {
//                        Button("Add Hero") {
//                            // Add hero code
//                        }
//                        .buttonStyle(.bordered)
//                    })
                } else {
                    List(filteredHeroes, id:  \.self) { hero in
                        Text(hero)
                    }
                    .searchable( text: $searchTerm)
                    .overlay {
                        if filteredHeroes.isEmpty {
                            ContentUnavailableView.search(text: searchTerm)
                        }
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    }
}

#Preview { EmptyState() }
