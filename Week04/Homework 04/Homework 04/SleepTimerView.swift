//
//  SleepTimerView.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import Foundation
import AVFoundation
import SwiftUI

struct SleepTimerView: View {
    // Time remaining in seconds. The source of truth.
    @State var timeCounting = 0
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
   
    var body: some View {
        VStack {
            TimeDisplay1(timeCounting: $timeCounting)
                .onTapGesture {
                    self.timerIsRunning.toggle() // Tap to stop and resume
                    
                }
        }
        .onReceive(timer) { _ in
            if self.timerIsRunning {
                self.timeCounting += 1
                print("Time Remaining:", self.timeCounting)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .navigationTitle("🛏️   Sleep Timer")
    }
}

struct TimeDisplay1: View {
    @Binding var timeCounting: Int
    
    var body: some View {
        let minutes = timeCounting / 60
        let seconds = timeCounting % 60
        VStack {
            Text(String(format: "%02d:%02d", minutes, seconds))
                .font(.system(size: 60))
                .foregroundColor(.white)
        }
    }
}
