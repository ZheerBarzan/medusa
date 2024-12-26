//
//  ProfileView.swift
//  medusa
//
//  Created by Zheer Barzan on 26/12/24.
//

import SwiftUI
import FirebaseAuth
struct ProfileView: View {
    @Binding var isLoggedIn: Bool// Bind the login state to navigate when logged out
    @StateObject private var profileViewModel = ProfileViewModel() // ViewModel for Login

    var body: some View {
        VStack {
            // Home screen content
            Text("Profile")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)

            Spacer()

            // Logout Button
            Button(action: {
                profileViewModel.logoutUser()
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
    
    
}


#Preview {
    ProfileView(isLoggedIn: .constant(true))
}
