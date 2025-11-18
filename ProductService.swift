import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProductService: ObservableObject {
    @Published var products: [Product] = []
    private var db = Firestore.firestore()

    func fetchProducts() {
        db.collection("products").addSnapshotListener { querySnapshot, error in
            if let documents = querySnapshot?.documents {
                self.products = documents.compactMap {
                    try? $0.data(as: Product.self)
                }
            }
        }
    }

    func addProduct(_ product: Product) {
        do {
            try db.collection("products").document().setData(from: product)
        } catch {
            print("Erreur ajout produit: \(error)")
        }
    }

    func updateProduct(_ product: Product) {
        if let productId = product.id as String? {
            do {
                try db.collection("products").document(productId).setData(from: product)
            } catch {
                print("Erreur maj produit: \(error)")
            }
        }
    }

    func removeProduct(_ product: Product) {
        if let productId = product.id as String? {
            db.collection("products").document(productId).delete()
        }
    }
}
