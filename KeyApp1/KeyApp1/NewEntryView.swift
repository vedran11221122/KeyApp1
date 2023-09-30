import SwiftUI

struct NewKeyEntryView: View {
    @State private var keyName = ""
    @State private var image: UIImage? = nil

    @EnvironmentObject var keyStorage: KeyStorage

    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(systemName: "camera")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    // Implement the camera capture logic here
                }
            
            TextField("Enter Key Name", text: $keyName)
                .padding()
            
            Button("Save Key") {
                guard let image = image, !keyName.isEmpty else { return }
                
                keyStorage.saveKey(name: keyName, image: image)
                
                self.image = nil
                self.keyName = ""
            }
        }
    }
}
