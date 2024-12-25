//
//  LoginViewModel.swift
//  medusa
//
//  Created by Zheer Barzan on 25/12/24.
//

import Foundation
import Foundation
import FirebaseAuth
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    @Published var isLoggedIn: Bool = false
    @Published var showRegisterView: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    // Authentication logic for login
    func loginUser() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.isLoggedIn = true
                print("User logged in successfully")
            }
        }
    }
    
    // Firebase Auth state listener
    func addAuthStateListener() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.isLoggedIn = true
            }
        }
    }
    
    // Register View navigation
    func navigateToRegisterView() {
        self.showRegisterView = true
    }
}
