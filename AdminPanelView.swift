import SwiftUI

struct AdminPanelView: View {
    @StateObject var productService = ProductService()
    @State private var name = ""
    @State private var price = ""
    @State private var imageUrl = ""

    var body: some View {
        VStack {
            Text("Ajouter un produit")
            TextField("Nom", text: $name)
            TextField("Prix", text: $price)
            TextField("Image URL", text: $imageUrl)
            Button("Ajouter") {
                let newProduct = Product(id: UUID().uuidString, name: name, price: Double(price) ?? 0, imageUrl: imageUrl)
                productService.addProduct(newProduct)
            }
            List(productService.products) { product in
                HStack {
                    Image(systemName: "photo") // À remplacer par image réelle via URL
                    Text(product.name)
                    Text("\(product.price, specifier: "%.2f")€")
                    Button("Modifier") {
                        // Naviguer vers une vue d’édition
                    }
                    Button("Supprimer") {
                        productService.removeProduct(product)
                    }
                }
            }
        }
        .onAppear { productService.fetchProducts() }
        .padding()
    }
}
