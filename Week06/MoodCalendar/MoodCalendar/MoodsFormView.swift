//
//  MoodsFormView.swift
//  MoodCalendar
//
//  Created by Channing Yang on 3/11/24.
//

import SwiftUI

struct MoodFormView: View {
    @EnvironmentObject var moodStore: MoodStore
    @StateObject var viewModel: MoodFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    DatePicker(selection: $viewModel.date) {
                        Text("Date and Time")
                    }
                    TextField("Note", text: $viewModel.note, axis: .vertical)
                        .focused($focus, equals: true)
                    Picker("Mood Type", selection: $viewModel.moodType) {
                        ForEach(Mood.MoodType.allCases) {moodType in
                            Text(moodType.icon + " " + moodType.rawValue.capitalized)
                                .tag(moodTyp
                        }
                    }
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            if viewModel.updating {
                                // update this mood
                                let mood = Mood(id: viewModel.id!,
                                                  moodType: viewModel.moodType,
                                                  date: viewModel.date,
                                                  note: viewModel.note)
                                moodStore.update(mood)
                            } else {
                                // create new mood
                                let newMood = Mood(moodType: viewModel.moodType,
                                                     date: viewModel.date,
                                                     note: viewModel.note)
                                moodStore.add(newMood)
                            }
                            dismiss()
                        } label: {
                            Text(viewModel.updating ? "Update Mood" : "Add Mood")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.incomplete)
                        Spacer()
                    }
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle(viewModel.updating ? "Update" : "New Mood")
            .onAppear {
                focus = true
            }
        }
    }
}

struct MoodFormView_Previews: PreviewProvider {
    static var previews: some View {
        MoodFormView(viewModel: MoodFormViewModel())
            .environmentObject(MoodStore())
    }
}

