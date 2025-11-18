import SwiftUI

struct BasketView: View {
    @EnvironmentObject var basket: BasketService

    var body: some View {
        VStack {
            List(basket.products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("\(product.price, specifier: "%.2f")€")
                }
            }
            Text("Total : \(basket.total, specifier: "%.2f")€")
            HStack {
                Button("Vider le panier") {
                    basket.clearBasket()
                }
                Button("Payer") {
                    // Logique à implémenter plus tard
                }
            }
            .padding()
        }
    }
}
