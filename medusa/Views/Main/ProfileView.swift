//
//  ProfileView.swift
//  medusa
//
//  Created by Zheer Barzan on 26/12/24.
//

import SwiftUI
import FirebaseAuth
struct ProfileView: View {
    @Binding var isLoggedIn: Bool // Bind the login state to navigate when logged out

    var body: some View {
        VStack {
            // Home screen content
            Text("Profile")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)

            Spacer()

            // Logout Button
            Button(action: {
                logoutUser()
            }, label: {
                Text("Logout")
                    .font(.system(.headline, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })

            Spacer()
        }
        .padding()
    }
    
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


#Preview {
    ProfileView(isLoggedIn: .constant(true))
}
