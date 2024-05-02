import UIKit

final class StackFactory {
    static func createHorizontalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fillEqually
        return stack
    }
    
    static func createVerticalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
