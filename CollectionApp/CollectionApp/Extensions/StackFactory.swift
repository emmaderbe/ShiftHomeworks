import UIKit

final class StackFactory {
    static func createVerticalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}

