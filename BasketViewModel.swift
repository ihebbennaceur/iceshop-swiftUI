import Foundation

class BasketViewModel: ObservableObject {
    @Published var items: [Product] = []
    var total: Double { items.reduce(0) { $0 + $1.price } }
    func add(_ product: Product) { items.append(product) }
    func clear() { items.removeAll() }
}
