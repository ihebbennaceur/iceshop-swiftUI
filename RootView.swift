import SwiftUI

struct RootView: View {
    @StateObject var authVM = AuthViewModel()
    var body: some View {
        Group {
            if authVM.isAuthenticated {
                HomeView().environmentObject(authVM)
            } else {
                LoginView().environmentObject(authVM)
            }
        }
    }
}
