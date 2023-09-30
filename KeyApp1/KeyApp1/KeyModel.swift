import Foundation

struct KeyModel: Identifiable {
    var id = UUID()
    var name: String
    var imageFileName: String
    var keyFeatures: [String] // You can store features like blade type, tip shape, shoulder style, etc.
}
