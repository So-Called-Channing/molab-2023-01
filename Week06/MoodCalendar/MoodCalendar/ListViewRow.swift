//
//  ListViewRow.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation

HStack {
    VStack(alignment: .leading) {
        HStack {
            Text(event.eventType.icon)
            Text(event.moodType.icon)
                .font(.system(size: 40))
            Text(event.note)
        }
        Text(
            event.date.formatted(date: .abbreviated,
                                 time: .shortened)
        )
    }
    Spacer()
    Button {
        formType = .update(event)
    } label: {
        Text("Edit")
    }
    .buttonStyle(.bordered)
}
}
}

struct ListViewRow_Previews: PreviewProvider {
static let event = Event(eventType: .social, date: Date(), note: "Let's party")
static let event = Event(moodType: .social, date: Date(), note: "Let's party")
static var previews: some View {
ListViewRow(event: event, formType: .constant(.new))
}
