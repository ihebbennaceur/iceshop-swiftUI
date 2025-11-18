import SwiftUI
import FirebaseAuth

class SessionStore: ObservableObject {
    @Published var user: User?
    var isLoggedIn: Bool { user != nil }

    func listen() {
        Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
