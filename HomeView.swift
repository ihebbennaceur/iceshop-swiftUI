import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var productVM = ProductViewModel()
    @StateObject var basketVM = BasketViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ProductListView()
                    .environmentObject(productVM)
                    .environmentObject(basketVM)
                NavigationLink("Voir le panier", destination: BasketView().environmentObject(basketVM))
                if authVM.user?.email == "admin@example.com" {
                    NavigationLink("Admin Panel", destination: AdminPanelView().environmentObject(productVM))
                }
                Button("Déconnexion") { authVM.signOut() }
            }.navigationTitle("Ice Cream Shop")
        }
    }
}
