//
//  _706012110055_Muhammad_Ghifari_Febriansyah_AFL_3App.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

@main
struct _706012110055_Muhammad_Ghifari_Febriansyah_AFL_3App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
