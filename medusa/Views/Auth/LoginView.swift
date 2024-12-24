//
//  LoginView.swift
//  medusa
//
//  Created by Zheer Barzan on 24/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            // hero image
            Image("Medusa")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            // welcome text
            Text("Welcome to Medusa")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)
            // login form
            // email textfield
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            // password textfield
            SecureField("Password", text: $password)
                .textContentType(.password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            // login button
            Button(action: {
                print("Login action")
            }, label: {
                Text("Login")
                    .font(.system(.headline, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
            // forgot password
            HStack {
                Text("Don't have an account?")
                    .font(.system(.subheadline, design: .monospaced))
                Button(action: {
                    print("Register action")
                }, label: {
                    Text("Register")
                        .font(.system(.subheadline, design: .monospaced))
                        .foregroundColor(.black)
                })
            }
            // OAuth buttons
            Text("Or Continue With")
                .font(.system(.subheadline, design: .monospaced))

            HStack(spacing: 30) {
                SquareTile(imagePath: "Apple", onTap: {
                    print("Apple Sign-In")
                })
                SquareTile(imagePath: "Google", onTap: {
                    print("Google Sign-In")
                })
                SquareTile(imagePath: "MS", onTap: {
                    print("Microsoft Sign-In")
                })
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    LoginView()
}
