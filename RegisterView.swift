import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Mot de passe", text: $password)
            Button("Créer un compte") {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                        showAlert = true
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Erreur"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .padding()
    }
}
