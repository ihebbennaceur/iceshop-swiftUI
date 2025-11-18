import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    @StateObject var basket = BasketService()

    var body: some View {
        NavigationView {
            VStack {
                ProductListView().environmentObject(basket)
                NavigationLink("Voir le panier", destination: BasketView().environmentObject(basket))
                if session.user?.email == "admin@example.com" {
                    NavigationLink("Admin Panel", destination: AdminPanelView())
                }
                Button("Déconnexion") {
                    session.signOut()
                }
            }
            .navigationTitle("Glacier")
        }
    }
}
