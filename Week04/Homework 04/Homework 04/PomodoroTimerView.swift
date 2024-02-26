//
//  PomodoroTimerView.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import AVFoundation
import SwiftUI

struct PomodoroTimerView: View {
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

struct TimeDisplay: View {
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

/*
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

*/



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

struct TimeDisplay: View {
    // Binding variable.
    @Binding var timeRemaining: Int
    
    var body: some View {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        
        VStack {
            Text(String(format: "%02d:%02d", minutes, seconds))
                .font(.system(size: 60))
                .foregroundColor(.white)
                .onTapGesture {
                    // On tap gesture, apply stop or resume function.
                    self.timerIsRunning.toggle()
                }
        }
    }
}

struct Pag11_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroTimerView()
    }
}

 
 
 struct PomodoroTimerView: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 60
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            // TimeDisplay view with data bindings.
            // NOTE: Syntax used for data bindings.
            TimeDisplay(timeRemaining: $timeRemaining)
            
            Button(action: {
                // Toggle timer on/off.
                self.timerIsRunning.toggle()
                
                // If timer is not running, reset back to 60
                if !self.timerIsRunning {
                    self.timeRemaining = 60
                }
            }) {
                // Start / Stop Button
                Text(timerIsRunning ? "Reset" : "Start")
                    .font(.system(size: 30))
                    .frame(width: 160, height: 60)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
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
        .background(Color.white)
    }
}
 */*/
