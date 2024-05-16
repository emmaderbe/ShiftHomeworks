import UIKit

final class ImageFactory {
    static func createRoundImage() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
