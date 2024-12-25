import FirebaseAuth
import Foundation


class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String? = nil
    
    func registerUser() {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
