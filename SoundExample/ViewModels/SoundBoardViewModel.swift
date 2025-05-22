//
//  SoundBoardViewModel.swift
//  SoundExample
//
//  Created by Russell Gordon on 2025-05-21.
//

import Foundation

// Keeps track of available sounds for the sound board view
@Observable
class SoundBoardViewModel: Observable {
    
    // MARK: Stored properties
    var sounds: [Sound]
    
    // MARK: Initializer(s)
    init() {
        
        // Initalize the array of available sounds with those defined as examples in the model
        self.sounds = [
            birds,
            paper,
            cat,
            cow
        ]
    }
    
}
