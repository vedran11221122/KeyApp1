import SwiftUI

struct KeyListView: View {
    @ObservedObject var keyManager = KeyManager.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(keyManager.keys) { key in
                    NavigationLink(destination: KeyDetailView(key: key)) {
                        Text(key.name)
                    }
                }
            }
            .navigationBarTitle("My Keys")
        }
    }
}
