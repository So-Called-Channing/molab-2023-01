//
//  PomodoroAudio.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import Foundation
import AVFoundation
import SwiftUI

struct PomodoroAudio: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 25 * 60
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
   
    var body: some View {
        VStack {
            TimeDisplay(timeRemaining: $timeRemaining)
                .onTapGesture {
                    self.timerIsRunning.toggle() // Tap to stop and resume
/*
                    if self.timerIsRunning {
                                            let audioURL = URL(string: "YOUR_AUDIO_URL_HERE")! // Replace with your audio URL
                                            AudioManager.shared.playAudio(from: audioURL)
                                        }
 */
                }
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 && self.timerIsRunning {
                self.timeRemaining -= 1
                print("Time Remaining:", self.timeRemaining)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .navigationTitle("🍅 Pomodoro")
    }
}


 let urlSounds = ["https://www.youtube.com/watch?v=q76bMs-NwRk"]

 func loadUrlAudio(_ urlString:String) -> AVAudioPlayer? {
     let url = URL(string: urlString)
     do {
         let data = try Data(contentsOf: url!)
         return try AVAudioPlayer(data: data)
     } catch {
         print("loadUrlSound error", error)
     }
     return nil
 }

struct PlayAudioUrlView: View {
    @State private var soundIndex = 0
    @State private var soundFile = urlSounds[0]
    @State private var player: AVAudioPlayer? = nil
    var body: some View {
        TimelineView(.animation) { context in
            VStack {
                HStack {
                    Button("▷") {
                        player = loadUrlAudio(soundFile)
                        print("player", player as Any)
                        player?.numberOfLoops = -1
                        player?.play()
                    }
                }
                Text("soundIndex \(soundIndex)")
                Text(soundFile)
                if let player = player {
                    Text("duration " + String(format: "%.1f", player.duration))
                    Text("currentTime " + String(format: "%.1f", player.currentTime))
 }
            }
        }
    }
}





// Codes that have been tried, some of them are from chatGPT

/*
struct PomodoroTimerView: View {
    
    @State var timeRemaining = 25 * 60
    @State var timerIsRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            // TimeDisplay view with data bindings.
            // NOTE: Syntax used for data bindings.
            TimeDisplay(timeRemaining: $timeRemaining)
/*
            Button(action: {
                // Toggle timer on/off.
                self.timerIsRunning.toggle()
                
            }) {
                // Start / Stop Button
                Text(timerIsRunning ? "Resume" : "Stop")
                    .font(.system(size: 30))
                    .frame(width: 160, height: 60)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
            }
            .preferredColorScheme(.dark)

 
 
        }
        
        .onReceive(timer) { _ in
            // Block gets called when timer updates.
            
            // If timeRemaining and timer is running, count down.
            if self.timeRemaining > 0 && self.timerIsRunning {
                self.timeRemaining -= 1
                
                print("Time Remaining:", self.timeRemaining)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .navigationTitle("🍅 Pomodoro")
    }
}
