//
//  Focused_Work_Week6_1App.swift
//  Focused Work Week6.1
//
//  Created by Channing Yang on 3/10/24.
//

import SwiftUI
import SwiftData

@main
struct Focused_Work_Week6_1App: App {
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
