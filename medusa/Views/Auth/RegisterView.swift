//
//  RegisterView.swift
//  medusa
//
//  Created by Zheer Barzan on 24/12/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack(spacing: 20) {
            

            Image("Medusa")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)

            Text("Create Your Account")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)

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

            SecureField("Password", text: $password)
                .textContentType(.newPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("Confirm Password", text: $confirmPassword)
                .textContentType(.newPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                if password == confirmPassword {
                    print("Registration successful")
                } else {
                    print("Passwords do not match")
                }
            }, label: {
                Text("Register")
                    .font(.system(.headline, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })

            HStack {
                Text("Already have an account?")
                    .font(.system(.subheadline, design: .monospaced))
                Button(action: {
                    print("Go to login")
                }, label: {
                    Text("Login")
                        .font(.system(.subheadline, design: .monospaced))
                        .foregroundColor(.black)
                })
            }

            Text("Or Continue With")
                .font(.system(.subheadline, design: .monospaced))

            HStack(spacing: 30) {
                SquareTile(imagePath: "Apple", onTap: {
                    print("Apple Sign-Up")
                })
                SquareTile(imagePath: "Google", onTap: {
                    print("Google Sign-Up")
                })
                SquareTile(imagePath: "MS", onTap: {
                    print("Microsoft Sign-Up")
                })
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    RegisterView()
}
