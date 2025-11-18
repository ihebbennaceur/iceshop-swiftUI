import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var error = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Mot de passe", text: $password)
            Button("Se connecter") {
                authVM.signIn(email: email, password: password) { err in
                    error = err ?? ""
                }
            }
            Button("Mot de passe oublié") {
                authVM.sendPasswordReset(email: email) { err in error = err ?? "" }
            }
            NavigationLink("Inscription", destination: RegisterView())
            if !error.isEmpty { Text("Erreur: \(error)").foregroundColor(.red) }
        }.padding()
    }
}
