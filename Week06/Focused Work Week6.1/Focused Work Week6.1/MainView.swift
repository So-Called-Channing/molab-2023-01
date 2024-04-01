//
//  MainView.swift
//  Focused Work Week6.1
//
//  Created by Channing Yang on 3/10/24.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Timer", systemImage: "list.dash")
                }

            MoodView()
                .tabItem {
                    Label("Mood", systemImage: "brain.head.profile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Mood())
    }
}
