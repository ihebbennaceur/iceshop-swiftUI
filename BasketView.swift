import SwiftUI

struct BasketView: View {
    @EnvironmentObject var basketVM: BasketViewModel
    var body: some View {
        VStack {
            List(basketVM.items) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("\(product.price, specifier: "%.2f") €")
                }
            }
            Text("Total: \(basketVM.total, specifier: "%.2f") €")
            HStack {
                Button("Vider le panier") { basketVM.clear() }
                Button("Payer") { /* Pas de logique backend */ }
            }
        }
    }
}
