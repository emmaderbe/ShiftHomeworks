import UIKit

final class LabelFactory {  
    static func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createOrdinaryLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
