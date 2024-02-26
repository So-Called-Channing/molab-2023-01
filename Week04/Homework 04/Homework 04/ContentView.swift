//
//  ContentView.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
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
                NavigationLink(destination: DetailView(title: "Preparation")) {
                    Text("⏲️    Preparation")
                }
                NavigationLink(destination: DetailView(title: "Sleep Timer")) {
                    Text("🛏️   Sleep Timer")
                }
                NavigationLink(destination: DetailView(title: "Reading")) {
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

// https://www.youtube.com/watch?v=X5hy3M47OC4&list=RDCMUCAkHGQ1Z78fH9WHp45Dq2rQ&start_radio=1&rv=X5hy3M47OC4&t=708
