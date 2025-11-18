import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var basketVM: BasketViewModel
    var body: some View {
        List(productVM.products) { product in
            HStack {
                AsyncImage(url: URL(string: product.imageUrl))
                Text(product.name)
                Text("\(product.price, specifier: "%.2f") €")
                Button("Ajouter au panier") { basketVM.add(product) }
            }
        }
        .onAppear { productVM.fetchProducts() }
    }
}
