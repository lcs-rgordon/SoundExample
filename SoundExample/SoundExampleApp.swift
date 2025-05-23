//
//  SoundExampleApp.swift
//  SoundExample
//
//  Created by Russell Gordon on 2025-05-21.
//

import AVFoundation
import SwiftUI

@main
struct SoundExampleApp: App {
    
    // MARK: Stored properties
    
    // Allows us to find when app is foregrounded or backgrounded
    @Environment(\.scenePhase) var scenePhase
    
    // Keeps track of which background audio track is currently playing
    @State private var backgroundAudioProvider = BackgroundAudioProvider()
    
    // The player for background audio in this app
    @State private var backgroundAudioPlayer: AVAudioPlayer?
    
    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            SoundBoardView()
                .environment(backgroundAudioProvider)
        }
        .onChange(of: backgroundAudioProvider.currentTrack) { oldSound, newSound in
            startPlaying(backgroundAudio: newSound)
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .active:
                startPlaying(backgroundAudio: backgroundAudioProvider.currentTrack)
            case .background:
                backgroundAudioPlayer?.stop()
            default:
                break
            }
        }
        
    }

    // MARK: Functions
    func startPlaying(backgroundAudio: Sound) {
        
        print("About to start playing background audio file \(backgroundAudio.filename)")
        
        // Make the player stop playing whatever sound might already be playing
        backgroundAudioPlayer?.stop()
        
        // Get a reference to the sound file from the app bundle
        guard let path = Bundle.main.path(forResource: backgroundAudio.filename, ofType: nil) else {
            print("File \(backgroundAudio.filename) for sound '\(backgroundAudio.name)' not found in app bundle.")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        // Actually play the audio file
        do {
            backgroundAudioPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundAudioPlayer?.numberOfLoops = Int.max
            backgroundAudioPlayer?.play()
        } catch {
            print("Unable to play \(backgroundAudio.name) with filename \(backgroundAudio.filename).")
        }
    }
}
