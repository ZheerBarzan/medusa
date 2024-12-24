//
//  medusaApp.swift
//  medusa
//
//  Created by Zheer Barzan on 23/12/24.
//

import SwiftUI
import Firebase

@main
struct medusaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
        }
    }
}
