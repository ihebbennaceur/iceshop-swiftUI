import SwiftUI

struct ProductListView: View {
    @StateObject var productService = ProductService()
    @EnvironmentObject var basket: BasketService

    var body: some View {
        List(productService.products) { product in
            HStack {
                Image(systemName: "photo") // Ou charger depuis product.imageUrl
                Text(product.name)
                Text("\(product.price, specifier: "%.2f")€")
                Button("Ajouter au panier") {
                    basket.addToBasket(product)
                }
            }
        }
        .onAppear { productService.fetchProducts() }
    }
}
