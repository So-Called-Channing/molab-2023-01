//
//  ContentView.swift
//  Focused Work Week6.1
//
//  Created by Channing Yang on 3/10/24.
//

import SwiftUI
import SwiftData
import Foundation


struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PomodoroTimerView()) {
                    Text("🍅    Pomodoro")
                }
                NavigationLink(destination: PreparationTimerView()) {
                    Text("⏲️    Preparation")
                }
                NavigationLink(destination: SleepTimerView()) {
                    Text("🛏️   Sleep Timer")
                }
                NavigationLink(destination: ReadingTimerView()) {
                    Text("📖    Reading")
                }
            }
            .navigationTitle("Timer")
            .preferredColorScheme(.dark)
        }
    }
}

struct DetailView: View {
    var title: String
    
    var body: some View {
        Text("\(title)")
            .navigationTitle(title)
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
