import SwiftUI


struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel() // ViewModel for Login
    
    var body: some View {
        VStack {
            switch loginViewModel.navigationState {
            case .login:
                loginViewContent
            case .home:
                HomeScreenView(isLoggedIn: $loginViewModel.isLoggedIn)
            }
        }
        .onAppear {
            loginViewModel.addAuthStateListener()
        }
        .onDisappear {
            loginViewModel.removeAuthStateListener()
        }
    }
    
    private var loginViewContent: some View {
        
        NavigationView{
            VStack(spacing: 20) {
                Image("Medusa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("Welcome to Medusa")
                    .font(.system(.title, design: .monospaced))
                    .foregroundColor(.black)
                
                TextField("Email", text: $loginViewModel.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                SecureField("Password", text: $loginViewModel.password)
                    .textContentType(.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                if let errorMessage = loginViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    loginViewModel.loginUser()
                }, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                
                HStack {
                    Text("Don't have an account?")
                        .font(.system(.subheadline, design: .monospaced))
                        .foregroundColor(.black)
                    NavigationLink(destination: RegisterView(), label: {
                        Text("Register")
                            .font(.system(.subheadline, design: .monospaced))
                            .foregroundColor(.black)
                    })
                }
                Text("Or Continue With")
                HStack(spacing: 20) {
                    SquareTile(imagePath: "Apple", onTap: { print("Apple Sign-In") })
                    SquareTile(imagePath: "Google", onTap: { print("Google Sign-In") })
                    SquareTile(imagePath: "MS", onTap: { print("Microsoft Sign-In") })
                }
                
               
                Spacer()
            }
        }
        
        .padding(.top)
    }
    
}
