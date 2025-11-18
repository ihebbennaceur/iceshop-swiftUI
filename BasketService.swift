import SwiftUI

class BasketService: ObservableObject {
    @Published var products: [Product] = []

    func addToBasket(_ product: Product) {
        products.append(product)
    }

    func clearBasket() {
        products.removeAll()
    }

    var total: Double {
        products.reduce(0) { $0 + $1.price }
    }
}
