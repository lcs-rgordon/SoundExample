//
//  Sound.swift
//  SoundExample
//
//  Created by Russell Gordon on 2025-05-21.
//

import Foundation

// Define a structure to describe a sound
struct Sound: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let filename: String
    let name: String
    let description: String
    let attributionText: String
    
}

// Example sounds
let birds = Sound(
    filename: "birds.wav",
    name: "Birds",
    description: "Birds tweeting, and so on.",
    attributionText: "AMB_Birds_Neckar by tobbler -- https://freesound.org/s/795381/ -- License: Attribution 4.0"
)

let paper = Sound(
    filename: "paper-rip.wav",
    name: "Ripping Paper",
    description: "The sound of a sheet of paper being ripped.",
    attributionText: "Paper Rip 22 by Geoff-Bremner-Audio -- https://freesound.org/s/806060/ -- License: Creative Commons 0"
)

let cat = Sound(
    filename: "cat-purring.wav",
    name: "Cat Purring",
    description: "A cut purrs contentedly.",
    attributionText: "Kisa's purr - black noble lady cat Kisa purrs peacefully by Erofey -- https://freesound.org/s/794503/ -- License: Creative Commons 0"
)

let cow = Sound(
    filename: "cow-mooing.mp3",
    name: "Cows Moo",
    description: "Some cows, doing cow things.",
    attributionText: "Cow Sounds Real Field Audio by DudeAwesome -- https://freesound.org/s/790277/ -- License: Attribution 4.0"
)
