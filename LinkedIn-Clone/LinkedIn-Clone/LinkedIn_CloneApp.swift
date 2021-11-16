//
//  LinkedIn_CloneApp.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI
import Firebase

@main
struct LinkedIn_CloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
