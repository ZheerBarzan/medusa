//
//  ProfileViewModel.swift
//  medusa
//
//  Created by Zheer Barzan on 26/12/24.
//

import Foundation
import FirebaseAuth


class ProfileViewModel: ObservableObject {
    // Placeholder for future library-related logic
    @Published var isLoggedIn: Bool = false
    
    
    
    
    func logoutUser() {
        // Logout the user using Firebase Auth
        do {
            try Auth.auth().signOut()
            // Set isLoggedIn to false to go back to the login screen
            isLoggedIn = false
            print("User logged out successfully")
        } catch let error {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
    
    
}
