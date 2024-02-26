//
//  PreparationTimerView.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import Foundation
import AVFoundation
import SwiftUI

struct PreparationTimerView: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 5 * 60
    
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
        .navigationTitle("⏲️    Preparation")
    }
}

/*
struct TimeDisplay1: View {
    @Binding var timeRemaining: Int
    
    var body: some View {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        VStack {
            Text(String(format: "%02d:%02d", minutes, seconds))
                .font(.system(size: 60))
                .foregroundColor(.white)
        }
    }
}
*/
