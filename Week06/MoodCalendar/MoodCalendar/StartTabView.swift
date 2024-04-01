//
//  StartTabView.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation
import SwiftUI

struct StartTabView: View {
    @EnvironmentObject var myMoods: moodStore
    var body: some View {
        HstackView{
            EventsCalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        StartTabView()
            .environmentObject(moodStore(preview: true))
    }
}
