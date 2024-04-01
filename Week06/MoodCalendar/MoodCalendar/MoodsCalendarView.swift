//
//  MoodsCalendarView.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation

struct MoodsCalendarView: View {
    @EnvironmentObject var moodStore: moodStore
    @State private var dateSelected: DateComponents?
    @State private var displayMoods = false
    @State private var formType: MoodFormType?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                             moodStore: moodStore,
                             dateSelected: $dateSelected,
                             displayMoods: $displayMoods)
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
            .sheet(item: $formType) { $0 }
            .sheet(isPresented: $displayMoods) {
                DaysMoodsListView(dateSelected: $dateSelected)
                    .presentationDetents([.medium, .large])
            }
            
                .navigationTitle("Calendar View")
        }
    }
}

struct MoodsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MoodsCalendarView()
            .environmentObject(moodStore(preview: true))
    }
}
