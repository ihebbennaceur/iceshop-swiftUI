import Foundation

struct Product: Identifiable, Codable {
    var id: String // Firestore document ID
    var name: String
    var price: Double
    var imageUrl: String
}
