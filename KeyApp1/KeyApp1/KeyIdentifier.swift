import Foundation
import UIKit

class KeyIdentifier {
    static let shared = KeyIdentifier()
    
    func identifyKey(image: UIImage, keyFeatures: [String]) -> String? {
        for key in KeyManager.shared.keys {
            if matchKeyFeatures(key: key, keyFeatures: keyFeatures) && matchKeyImage(key: key, image: image) {
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
    
    private func matchKeyImage(key: KeyModel, image: UIImage) -> Bool {
        if let savedImage = UIImage(named: key.imageFileName),
           let imageData1 = savedImage.pngData(),
           let imageData2 = image.pngData() {
            return imageData1.elementsEqual(imageData2)
        }
        return false
    }
}
