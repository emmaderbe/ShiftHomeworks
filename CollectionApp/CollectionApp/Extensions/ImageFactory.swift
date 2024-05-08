import UIKit

final class ImageFactory {
    static func createRoundImage() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        DispatchQueue.main.async {
            image.layer.cornerRadius = image.bounds.height / 2
        }
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
