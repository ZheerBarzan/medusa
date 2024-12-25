import SwiftUI

struct RegisterView: View {
    @StateObject private var loginViewModel = LoginViewModel() // ViewModel for Login
    @StateObject private var registerViewModel = RegisterViewModel() // ViewModel for Register
    
     var body: some View {
        VStack(spacing: 20) {
            Image("Medusa")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            Text("Create Your Account")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)
            
            TextField("Email", text: $registerViewModel.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Password", text: $registerViewModel.password)
                .textContentType(.newPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Confirm Password", text: $registerViewModel.confirmPassword)
                .textContentType(.newPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            if let errorMessage = registerViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
            
            Button(action: {
                registerViewModel.registerUser()
            }, label: {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
            
            HStack {
                Text("Already have an account?")
                Button(action: {
                    loginViewModel.navigateToLoginView()
                }, label: {
                    Text("Login")
                        .foregroundColor(.black)
                })
            }
            
            Text("Or Continue With")
            HStack {
                SquareTile(imagePath: "Apple", onTap: { print("Apple Sign-In") })
                SquareTile(imagePath: "Google", onTap: { print("Google Sign-In") })
                SquareTile(imagePath: "MS", onTap: { print("Microsoft Sign-In") })
            }
            Spacer()
        }
    }
}
