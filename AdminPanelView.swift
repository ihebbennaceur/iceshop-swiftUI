import SwiftUI

struct AdminPanelView: View {
    @EnvironmentObject var productVM: ProductViewModel
    @State private var name = ""
    @State private var price = ""
    @State private var imageUrl = ""

    var body: some View {
        VStack {
            TextField("Nom", text: $name)
            TextField("Prix", text: $price)
            TextField("Image URL", text: $imageUrl)
            Button("Ajouter") {
                let product = Product(id: UUID().uuidString, name: name, price: Double(price) ?? 0, imageUrl: imageUrl)
                productVM.addProduct(product)
            }
            List(productVM.products) { product in
                HStack {
                    Text(product.name)
                    Text("\(product.price, specifier: "%.2f") €")
                    Button("Supprimer") { productVM.deleteProduct(id: product.id) }
                }
            }
        }
        .onAppear { productVM.fetchProducts() }
    }
}
