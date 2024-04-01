import Foundation

@MainActor
class MoodStore: ObservableObject {
    @Published var moods = [Mood]()
    @Published var preview: Bool
    @Published var changedMood: Mood?
    @Published var movedMood: Mood?

    init(preview: Bool = false) {
        self.preview = preview
        fetchMoods()
    }

    func fetchMoods() {
        if preview {
            moods = Mood.sampleMoods
        } else {
            // load from your persistence store
        }
    }

    func delete(_ mood: Mood) {
        if let index = moods.firstIndex(where: {$0.id == mood.id}) {
            changedMood = moods.remove(at: index)
        }
    }

    func add(_ mood: Mood) {
        moods.append(mood)
        changedMood = mood
    }

    func update(_ mood: Mood) {
        if let index = moods.firstIndex(where: {$0.id == mood.id}) {
            movedMood = moods[index]
            moods[index].date = mood.date
            moods[index].note = mood.note
            moods[index].moodType = mood.moodType
            changedMood = mood
        }
    }

}
