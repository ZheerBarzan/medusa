import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    // Binding variables to control navigation between views and login state
    @Binding var showRegisterView: Bool
    @Binding var isLoggedIn: Bool // Bind the login state so that the parent view can track login status
    
    // State variables to hold user inputs and error messages
    @State private var email = ""  // User's email input
    @State private var password = ""  // User's password input
    @State private var confirmPassword = ""  // User's password confirmation input
    @State private var errorMessage: String? = nil  // Holds error messages to display on failure

    var body: some View {
        VStack(spacing: 20) {
            // Hero Image
            Image("Medusa")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            // Title Text
            Text("Create Your Account")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)
            
            // Email TextField for user to input email address
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
            
            // SecureField for password input (hides text entered by user)
            SecureField("Password", text: $password)
                .textContentType(.newPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // SecureField for confirming the password
            SecureField("Confirm Password", text: $confirmPassword)
                .textContentType(.newPassword)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)

            // Display error message if registration fails or passwords don't match
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.system(.subheadline, design: .monospaced))
                    .padding(.horizontal)
            }

            // Register Button, triggers user registration process
            Button(action: {
                // Check if password and confirm password match
                if password == confirmPassword {
                    registerUser()  // Register the user if passwords match
                    showRegisterView = false // After registration, go back to login view
                } else {
                    errorMessage = "Passwords do not match" // Show error if passwords don't match
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
            
            // HStack to display "Already have an account?" message and Login button
            HStack {
                Text("Already have an account?")
                    .font(.system(.subheadline, design: .monospaced))
                
                Button(action: {
                    showRegisterView = false // Switch to login view when user taps Login
                }, label: {
                    Text("Login")
                        .font(.system(.subheadline, design: .monospaced))
                        .foregroundColor(.black)
                })
            }

            // Prompt for OAuth login options (Apple, Google, MS)
            Text("Or Continue With")
                .font(.system(.subheadline, design: .monospaced))

            // Buttons for third-party OAuth sign-ins
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
            
            Spacer() // Pushes content to the top of the screen
        }
        
    }
    
    // Function to register the user using Firebase Authentication
    func registerUser() {
        // Attempt to create a new user with the provided email and password
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                // If an error occurs, display it
                errorMessage = error.localizedDescription
                print("Error registering: \(error.localizedDescription)")
            } else {
                // If registration is successful, log the user in automatically
                print("User registered successfully")
                
                // Immediately log in the user after successful registration
                loginUser()
            }
        }
    }

    // Function to log in the user after successful registration
    func loginUser() {
        // Attempt login with Firebase Auth using the same email and password
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                // If an error occurs during login, display the error
                errorMessage = error.localizedDescription
                print("Error logging in: \(error.localizedDescription)")
            } else {
                // If login is successful, set the isLoggedIn state to true
                isLoggedIn = true
                print("User logged in successfully")
            }
        }
    }
}

#Preview {
    RegisterView(showRegisterView: .constant(true), isLoggedIn: .constant(false))
}
