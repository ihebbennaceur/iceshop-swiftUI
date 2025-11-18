import SwiftUI

struct ContentView: View {
    @StateObject var session = SessionStore()

    var body: some View {
        Group {
            if session.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
        .environmentObject(session)
    }
}
