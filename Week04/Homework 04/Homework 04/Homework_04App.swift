//
//  Homework_04App.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import SwiftUI
import SwiftData

@main
struct Homework_04App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/*
@main
struct Homework_04App: App {
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
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
*/
