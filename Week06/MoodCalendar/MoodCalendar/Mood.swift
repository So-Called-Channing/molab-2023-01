//
//  Mood.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import Foundation

struct Mood: Identifiable {
    enum MoodType: String, Identifiable, CaseIterable {
        case veryUnpleasant, Unpleasant, Neutral, Pleasant, veryPleasant, unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .veryUnpleasant:
                return "🟣"
            case .Unpleasant:
                return "🔵"
            case .Neutral:
                return "⚪️"
            case .Pleasant:
                return "🟢"
            case .veryPleasant:
                return "🟠"
            }
        }
    }

    var moodType: MoodType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, moodType: MoodType = .unspecified, date: Date, note: String) {
        self.moodType = moodType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleMoods: [Mood] {
        return [
            Mood(moodType: .Unpleasant, date: Date().diff(numDays: 0), note: "upset"),
            Mood(moodType: .Neutral, date: Date().diff(numDays: 6), note: "normal"),
            Mood(moodType: .Neutral, date: Date().diff(numDays: 2), note: "Grateful"),
            Mood(moodType: .veryUnpleasant, date: Date().diff(numDays: -1), note: "Anxious"),
            Mood(moodType: .Pleasant, date: Date().diff(numDays: -3), note: "Grateful"),
        ]
    }
}
