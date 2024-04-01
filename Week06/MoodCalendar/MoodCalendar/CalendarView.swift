//
//  CalendarView.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation
import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var moodStore: moodStore
    @Binding var dateSelected: DateComponents?
    @Binding var displayMoods: Bool
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, moodStore: _moodStore)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let changedMood = moodStore.changedMood {
            uiView.reloadDecorations(forDateComponents: [changedMood.dateComponents], animated: true)
            moodStore.changedMood = nil
        }

        if let movedMood = moodStore.movedMood {
            uiView.reloadDecorations(forDateComponents: [movedMood.dateComponents], animated: true)
            moodStore.movedMood = nil
        }
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        var parent: CalendarView
        @ObservedObject var moodStore: moodStore
        init(parent: CalendarView, moodStore: ObservedObject<moodStore>) {
            self.parent = parent
            self._moodStore = moodStore
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView,
                          decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            let foundMoods = moodStore.moods
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
            if foundMoods.isEmpty { return nil }

            if foundMoods.count > 1 {
                return .image(UIImage(systemName: "doc.on.doc.fill"),
                              color: .red,
                              size: .large)
            }
            let singleMood = foundMoods.first!
            return .customView {
                let icon = UILabel()
                icon.text = singleMood.moodType.icon
                return icon
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
            guard let dateComponents else { return }
            let foundMoods = moodStore.moods
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
            if !foundMoods.isEmpty {
                parent.displayMoods.toggle()
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
        
    }
    
}
