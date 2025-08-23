//
//  ContentView.swift
//  VayureConnect_App
//
//  Created by Liam H on 19/8/2025.
//
//  This is my first time programming with Xcode and the Swift language and I’ve found the learning curve a bit challenging, especially when it comes to positioning elements and managing controls, which can feel unintuitive at times.

//  Thankfully, I’ve discovered some really helpful tutorials on YouTube that made things much clearer:

//  CodeWithChris – Playlists - https://www.youtube.com/@CodeWithChris/playlists
//  SwiftUI Tutorial Series - https://www.youtube.com/playlist?list=PLMRqhzcHGw1ZHtM5xYcZbJ8oUZ0aVTasI
//  Swift Basics for Beginners - https://www.youtube.com/playlist?list=PLMRqhzcHGw1Yw2XJyHnxoEXPBCdMaRzkf

import SwiftUI

struct ContentView: View {
    @StateObject var authManager = AuthManager()

    var body: some View {
        Group {
            if authManager.isAuthenticated {
                MainDashboard()
            } else {
                LoginScreen()
            }
        }
        .environmentObject(authManager)
    }
}

#Preview {
    ContentView()
}
