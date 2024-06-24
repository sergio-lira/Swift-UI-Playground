//
//  Swift_PlaygroundApp.swift
//  Swift Playground
//
//  Created by Sergio Lira on 5/19/24.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct Swift_PlaygroundApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ProjectIndexView()
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
        .modelContainer(sharedModelContainer)
    }
}
