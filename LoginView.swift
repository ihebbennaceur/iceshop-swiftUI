import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionStore
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Mot de passe", text: $password)
            Button("Connexion") {
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                        showAlert = true
                    } else {
                        session.listen()
                    }
                }
            }
            Button("Mot de passe oublié ?") {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                        showAlert = true
                    }
                }
            }
            NavigationLink("Inscription", destination: RegisterView())
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Erreur"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .padding()
    }
}
