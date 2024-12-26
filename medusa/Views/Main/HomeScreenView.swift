import SwiftUI
import FirebaseAuth

struct HomeScreenView: View {
    @Binding var isLoggedIn: Bool // Bind the login state to navigate when logged out

    var body: some View {
    
        TabView{
            LibraryView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Library")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))

                }.tag(0)
            CameraView()
                .tabItem {
                    Image(systemName: "camera")
                    Text("Camera")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))

                }.tag(1)
            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))

                }.tag(2)
        }.accentColor(.black)
            
    }
    
  
}

#Preview {
    HomeScreenView(isLoggedIn: .constant(true))
}
