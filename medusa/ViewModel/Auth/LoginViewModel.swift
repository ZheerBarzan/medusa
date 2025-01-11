//
//  LoginViewModel.swift
//  medusa
//
//  Created by Zheer Barzan on 25/12/24.
//
import Foundation
import FirebaseAuth


class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    @Published var isLoggedIn: Bool = false
    @Published var navigationState: NavigationState = .login
    
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?

    enum NavigationState {
        case login
        case home
    }
    
    func addAuthStateListener() {
        authStateListenerHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
            self.navigationState = user != nil ? .home : .login
        }
    }
    
    func removeAuthStateListener() {
        if let handle = authStateListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.isLoggedIn = true
                self.navigationState = .home
            }
        }
    }
    
    func navigateToLoginView() {
        navigationState = .login
    }
}
