//
//  SettingsView.swift
//  SoundExample
//
//  Created by Russell Gordon on 2025-05-22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Stored properties
    
    // Access the background audio provider class
    @Environment(BackgroundAudioProvider.self) var backgroundAudioProvider
    
    // Controls whether this view is showing or not
    @Binding var isShowing: Bool
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            // Create a two-way binding to the BackgroundAudioProvider class
            @Bindable var backgroundAudioProviderBindable = backgroundAudioProvider
            
            VStack(spacing: 20) {
                
                Toggle("Play background audio", isOn: $backgroundAudioProviderBindable.isOn)

                HStack {
                    
                    Text("Which track?")
                    
                    Spacer()
                    
                    Picker("Select your track", selection: $backgroundAudioProviderBindable.currentTrack) {
                        ForEach(backgroundAudioProvider.tracks) { track in
                            Text(track.name).tag(track)
                        }
                    }

                }
                
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem {
                    Button("Done") {
                        isShowing = false
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @Previewable @State var isShowingSettings = true
    
    Text("View that is behind this sheet")
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(isShowing: $isShowingSettings)
                .environment(BackgroundAudioProvider())
                .presentationDetents([.fraction(0.25), .medium])
        }
}
