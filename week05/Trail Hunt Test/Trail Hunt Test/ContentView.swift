//
//  ContentView.swift
//  Trail Hunt Test
//
//  Created by Channing Yang on 2/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        VStack {
            Text("First Struct Code")
                .font(.title)
                .padding()
            CodeSnippet1()
                .border(Color.gray)
                .padding()

            Text("Second Struct Code")
                .font(.title)
                .padding()
            CodeSnippet2()
                .border(Color.gray)
                .padding()

            // Add more struct code snippets as needed
        }
        .padding()
    }
}

struct CodeSnippet1: View {
    var body: some View {
        Text("This is the first struct code snippet")
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}

struct CodeSnippet2: View {
    var body: some View {
        Text("This is the second struct code snippet")
            .padding()
            .background(Color.green)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
