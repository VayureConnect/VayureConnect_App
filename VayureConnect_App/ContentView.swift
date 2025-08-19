//
//  ContentView.swift
//  VayureConnect_App
//
//  Created by Liam H on 19/8/2025.
//

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
