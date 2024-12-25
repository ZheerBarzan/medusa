//
//  RegisterViewModel.swift
//  medusa
//
//  Created by Zheer Barzan on 25/12/24.
//

import Foundation
import FirebaseAuth
import Combine

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String? = nil
    @Published var isLoggedIn: Bool = false
    @Binding var showRegisterView: Bool
    
    init(showRegisterView: Binding<Bool>, isLoggedIn: Binding<Bool>) {
        self._showRegisterView = showRegisterView
        self._isLoggedIn = isLoggedIn
    }
    
    // Register user in Firebase
    func registerUser() {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("Error registering: \(error.localizedDescription)")
            } else {
                self.loginUser() // Automatically log in the user after registration
            }
        }
    }
    
    // Log the user in after successful registration
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("Error logging in: \(error.localizedDescription)")
            } else {
                self.isLoggedIn = true
                print("User logged in successfully")
            }
        }
    }
}
