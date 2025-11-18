import SwiftUI
import Firebase

@main
struct IceCreamShopApp: App {
    init() { FirebaseApp.configure() }
    var body: some Scene {
        WindowGroup { RootView() }
    }
}
