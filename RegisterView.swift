import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var error = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Mot de passe", text: $password)
            Button("Créer le compte") {
                authVM.signUp(email: email, password: password) { err in
                    error = err ?? ""
                }
            }
            if !error.isEmpty { Text("Erreur: \(error)").foregroundColor(.red) }
        }.padding()
    }
}
