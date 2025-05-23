//
//  BackgroundAudioProvider.swift
//  SoundExample
//
//  Created by Russell Gordon on 2025-05-22.
//

import Foundation

// Keeps track of available background audio for the entire app
@Observable @MainActor
class BackgroundAudioProvider: Observable {
    
    // MARK: Stored properties
    
    // What track to play right now
    var currentTrack: Sound
    
    // Whether background audio is turned on or not
    var isOn: Bool
    
    // List of available background audio tracks (loopable)
    var tracks: [Sound]
    
    // MARK: Initializer(s)
    init() {
        
        // Initalize the array of available tracks with those defined as examples in the model
        self.tracks = [
            piano,
            guitar
        ]
        
        // Set background audio to play
        self.isOn = true
        
        // Set a background audio file to start playing
        self.currentTrack = piano
        
    }
    
}
