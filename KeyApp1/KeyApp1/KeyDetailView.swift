import SwiftUI

struct KeyDetailView: View {
    var key: KeyModel
    
    var body: some View {
        VStack {
            Text(key.name)
            Image(key.imageFileName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            // Display other key details here
        }
        .navigationBarTitle(key.name)
    }
}
