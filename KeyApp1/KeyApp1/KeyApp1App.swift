import SwiftUI

@main
struct KeyIdentificationApp: App {
    let keyStorage = KeyStorage.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(keyStorage) // Inject the KeyStorage instance
        }
    }
}
