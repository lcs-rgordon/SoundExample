//
//  ContentView.swift
//  SoundExample
//
//  Created by Russell Gordon on 2025-05-21.
//

import AVFoundation
import SwiftUI

struct SoundBoardView: View {
    
    // MARK: Stored properties
    
    // Access view model which contains an array of sounds to be played
    @State private var viewModel = SoundBoardViewModel()
    
    // Create an instance of the audio player that will play various sounds
    @State private var player: AVAudioPlayer?
    
    // What text should be shown for attributing the source of the current sound
    @State private var attribution = ""
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                                
                // Make a grid of buttons to create the sound board, with two columns
                LazyVGrid(
                    columns: [
                        GridItem(),
                        GridItem()
                    ],
                    spacing: 30
                ) {
                    
                    // Iterate over all the available sounds
                    ForEach(viewModel.sounds) { sound in
                        
                        // Make a button based on the current sound
                        Button {
                            
                            // Make the player stop playing whatever sound might already be playing
                            player?.stop()
                            
                            // Get a reference to the sound file from the app bundle
                            guard let path = Bundle.main.path(forResource: sound.filename, ofType: nil) else {
                                print("File \(sound.filename) for sound '\(sound.name)' not found in app bundle.")
                                return
                            }
                            let url = URL(fileURLWithPath: path)
                            
                            // Actually play the sound
                            do {
                                player = try AVAudioPlayer(contentsOf: url)
                                player?.play()
                                // Show the attribution text
                                attribution = sound.attributionText
                            } catch {
                                print("Unable to play \(sound.name) with filename \(sound.filename).")
                            }
                            
                        } label: {
                            
                            // Show the sounds name on the button
                            Text(sound.name)
                                .frame(width: 100)
                        }
                        .buttonStyle(.borderedProminent)

                    }
                }
                .padding(.top, 40)

                Spacer()

                // Show where the sound came from
                Text("Attribution")
                    .bold()
                    .opacity(attribution.isEmpty ? 0.0 : 1.0)
                
                Text(attribution)
                    .padding(.top, 10)

                // Allow user to stop playing a sound
                Button {
                    player?.stop()
                    attribution = ""
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                // Disable the button when no sound is selected OR when the sound has been selected but is no longer playing
                .disabled(player == nil || player != nil && player!.isPlaying == false)

                
            }
            .navigationTitle("Sound Board")
        }
        .padding()
    }
}

#Preview {
    SoundBoardView()
}
