import UIKit

class HobbyView: UIView {
    let firstHobbyCell = HobbyCellView()
    let secondHobbyCell = HobbyCellView()
    let thirdHobbyCell = HobbyCellView()
    let fourthHobbyCell = HobbyCellView()
    
    private let firstHorizStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fillEqually
        return stack
    }()
    private let secondHorizStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HobbyView {
    private func setupView() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(firstHorizStackView)
        verticalStackView.addArrangedSubview(secondHorizStackView)
        
        firstHorizStackView.addArrangedSubview(firstHobbyCell)
        firstHorizStackView.addArrangedSubview(secondHobbyCell)
        
        secondHorizStackView.addArrangedSubview(thirdHobbyCell)
        secondHorizStackView.addArrangedSubview(fourthHobbyCell)
        
        configureCells()
    }
}

extension HobbyView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension HobbyView {
    private func configureCells() {
        let cells = [firstHobbyCell, secondHobbyCell, thirdHobbyCell, fourthHobbyCell]
        cells.forEach { cell in
            cell.layer.cornerRadius = 16
        }
    }
}

