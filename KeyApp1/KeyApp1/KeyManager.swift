import Foundation
import SwiftUI

class KeyManager: ObservableObject {
    static let shared = KeyManager()
    
    @Published var keys: [KeyModel] = []
    
    func addKey(name: String, imageFileName: String, keyFeatures: [String]) {
        let key = KeyModel(name: name, imageFileName: imageFileName, keyFeatures: keyFeatures)
        keys.append(key)
    }
    
    func findMatchingKey(imageFileName: String, keyFeatures: [String]) -> String? {
        for key in keys {
            if matchKeyFeatures(key: key, keyFeatures: keyFeatures) && matchKeyImage(key: key, imageFileName: imageFileName) {
                return key.name
            }
        }
        return nil
    }
    
    private func matchKeyFeatures(key: KeyModel, keyFeatures: [String]) -> Bool {
        for feature in keyFeatures {
            if !key.keyFeatures.contains(feature) {
                return false
            }
        }
        return true
    }
    
    private func matchKeyImage(key: KeyModel, imageFileName: String) -> Bool {
        return key.imageFileName == imageFileName
    }
}
