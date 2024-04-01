//
//  DailyMoods.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation

import SwiftUI

struct DailyMoodsListView: View {
    @EnvironmentObject var moodStore: moodStore
    @Binding var dateSelected: DateComponents?
    @State private var formType: MoodFormType?
    
    var body: some View {
        NavigationStack {
            Group {
                if let dateSelected {
                    let foundMoods = moodStore.moods
                        .filter {$0.date.startOfDay == dateSelected.date!.startOfDay}
                    List {
                        ForEach(foundMoods) { mood in
                            ListViewRow(mood: mood, formType: $formType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        moodStore.delete(mood)
                                        moodStore.delete(mood)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                                .sheet(item: $formType) { $0 }
                        }
                    }
                }
            }
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
        }
    }
}

struct DailyMoodsListView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    static var previews: some View {
        DailyMoodsListView(dateSelected: .constant(dateComponents))
            .environmentObject(moodStore(preview: true)
            )
    }
}
