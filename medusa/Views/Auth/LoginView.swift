import SwiftUI
import FirebaseAuth

struct LoginView: View {
    // State variables to hold user inputs, errors, and view states
    @State private var email = ""  // User's email input
    @State private var password = ""  // User's password input
    @State private var errorMessage: String? = nil  // Error message to display on login failure
    @State private var isLoggedIn = false  // Boolean to track if the user is logged in
    @State private var showRegisterView = false // State to control switching to RegisterView

    var body: some View {
        VStack {
            // Conditional rendering based on the states
            if showRegisterView {
                // If the showRegisterView state is true, show the RegisterView
                RegisterView(showRegisterView: $showRegisterView, isLoggedIn: $isLoggedIn)
            } else if isLoggedIn {
                // If the user is logged in, show the HomeScreenView
                HomeScreenView(isLoggedIn: $isLoggedIn)
            } else {
                // Otherwise, show the login form
                loginViewContent
            }
        }
    }
    
    // This computed property returns the login form view
    var loginViewContent: some View {
        VStack(spacing: 20) {
            // Hero Image
            Image("Medusa")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            // Welcome text
            Text("Welcome to Medusa")
                .font(.system(.title, design: .monospaced))
                .foregroundColor(.black)
            
            // Login Form
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
            
            // SecureField for password input, hides the entered text
            SecureField("Password", text: $password)
                .textContentType(.password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.system(.subheadline, design: .monospaced))
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Error message display, shown if login fails
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.system(.subheadline, design: .monospaced))
                    .padding(.horizontal)
            }
            
            // Login Button, triggers the login process when pressed
            Button(action: {
                LoginUser()  // Calls the login function
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
            
            // HStack to display message and button to navigate to RegisterView
            HStack {
                Text("Don't have an account?")
                    .font(.system(.subheadline, design: .monospaced))
                
                Button(action: {
                    showRegisterView = true  // Switches to RegisterView when tapped
                }, label: {
                    Text("Register")
                        .font(.system(.subheadline, design: .monospaced))
                        .foregroundColor(.black)
                })
            }
            
            // Option to continue with social logins (Apple, Google, Microsoft)
            Text("Or Continue With")
                .font(.system(.subheadline, design: .monospaced))

            HStack(spacing: 30) {
                // These are placeholders for OAuth buttons (Apple, Google, MS)
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
        // Listener to detect if user is already logged in
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    isLoggedIn.toggle()  // Update login state if user is logged in
                }
            }
        }
    }

    // Function that handles the login process
    private func LoginUser() {
        // Ensure both email and password fields are filled
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."  // Show error if fields are empty
            return
        }
        
        // Attempt login using Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription  // Display error if login fails
            } else {
                // If login is successful, update the login state
                isLoggedIn = true
                print("User logged in")  // Log success message
            }
        }
    }
}

#Preview {
    LoginView()  // Display the LoginView for preview in SwiftUI
}
