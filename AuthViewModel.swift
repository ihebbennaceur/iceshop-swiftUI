import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: FirebaseAuth.User?
    init() { listen() }
    func listen() {
        Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
            self.isAuthenticated = user != nil
        }
    }
    func signIn(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            completion(error?.localizedDescription)
        }
    }
    func signUp(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            completion(error?.localizedDescription)
        }
    }
    func signOut() {
        try? Auth.auth().signOut()
    }
    func sendPasswordReset(email: String, completion: @escaping (String?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error?.localizedDescription)
        }
    }
}
