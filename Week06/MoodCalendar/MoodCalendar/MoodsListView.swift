//
//  MoodsListView.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation

import SwiftUI

struct MoodsListView: View {
    @EnvironmentObject var myMoods: moodStore
    @State private var formType: MoodFormType?
    var body: some View {
        NavigationStack {
            List {
                ForEach(myMoods.moods.sorted {$0.date < $1.date }) { mood in
                    ListViewRow(mood: mood, formType: $formType)
                    .swipeActions {
                        Button(role: .destructive) {
                            myMoods.delete(mood)
                        } label: {
                            Image(systemName: "trash")
                        }

struct MoodsListView: View {
struct MoodsListView_Previews: PreviewProvider {
    static var previews: some View {
        MoodsListView()
            .environmentObject(MoodStore(preview: true))
    }
        .padding(.vertical, 10)
}

class EventFormViewModel: ObservableObject {
    @Published var date = Date()
    @Published var note = ""
    @Published var eventType: Event.EventType = .unspecified

    var id: String?
    var updating: Bool { id != nil }

    init() {}

    init(_ event: Event) {
        date = event.date
        note = event.note
        eventType = event.eventType
        id = event.id
    }

    var incomplete: Bool {
        note.isEmpty
    }
}
