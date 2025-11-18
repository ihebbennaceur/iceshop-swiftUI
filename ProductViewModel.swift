import Foundation
import FirebaseFirestore

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    let db = Firestore.firestore()
    
    func fetchProducts() {
        db.collection("products").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.products = documents.compactMap { doc in
                try? doc.data(as: Product.self)
            }
        }
    }
    
    func addProduct(_ product: Product) {
        let doc = db.collection("products").document(product.id)
        do {
            try doc.setData(from: product)
        } catch {
            print("Erreur ajout: \(error)")
        }
    }
    
    func updateProduct(_ product: Product) {
        let doc = db.collection("products").document(product.id)
        do {
            try doc.setData(from: product)
        } catch {
            print("Erreur modif: \(error)")
        }
    }
    func deleteProduct(id: String) {
        db.collection("products").document(id).delete()
    }
}
