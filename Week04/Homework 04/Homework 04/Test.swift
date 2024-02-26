//
//  FocusPage.swift
//  Homework 04
//
//  Created by Channing Yang on 2/26/24.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // MARK: - Properties
    
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    var secondsRemaining = 0
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the white noise audio file
        loadWhiteNoise()
    }
    
    // MARK: - Audio
    
    func loadWhiteNoise() {
        guard let soundURL = Bundle.main.url(forResource: "whitenoise", withExtension: "mp3") else {
            print("Failed to load white noise audio file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
    }
    
    func playWhiteNoise() {
        audioPlayer?.play()
    }
    
    // MARK: - Timer
    
    func startTimer(durationInSeconds: Int) {
        secondsRemaining = durationInSeconds
        updateTimerLabel()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.secondsRemaining -= 1
            self.updateTimerLabel()
            if self.secondsRemaining == 0 {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateTimerLabel() {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    // MARK: - Actions
    
    @IBAction func startWorkButtonTapped(_ sender: UIButton) {
        playWhiteNoise()
        // Set the duration of work in seconds (e.g., 25 minutes = 25 * 60 seconds)
        startTimer(durationInSeconds: 25 * 60)
    }
    
    @IBAction func stopWorkButtonTapped(_ sender: UIButton) {
        stopTimer()
        audioPlayer?.stop()
    }
}
