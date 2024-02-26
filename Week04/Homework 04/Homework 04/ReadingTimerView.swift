//
//  Reading.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import Foundation
import AVFoundation
import SwiftUI

struct ReadingTimerView: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 60 * 60
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
   
    var body: some View {
        VStack {
            TimeDisplay(timeRemaining: $timeRemaining)
                .onTapGesture {
                    self.timerIsRunning.toggle() // Tap to stop and resume
                    
                }
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 && self.timerIsRunning {
                self.timeRemaining -= 1
                print("Time Remaining:", self.timeRemaining)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .navigationTitle("📖    Reading")
    }
}
