import UIKit

class HobbyView: UIView {
    private let firstSquareCell = HobbySquareView()
    private let secondSquareCell = HobbySquareView()
    private let thirdSquareCell = HobbySquareView()
    private let fourthSquareCell = HobbySquareView()
    
    private let firstHorizStackView = StackFactory.createHorizontalStack()
    private let secondHorizStackView = StackFactory.createHorizontalStack()
    
    private let verticalStackView = StackFactory.createVerticalStack()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HobbyView {
    func setupView() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(firstHorizStackView)
        verticalStackView.addArrangedSubview(secondHorizStackView)
        
        firstHorizStackView.addArrangedSubview(firstSquareCell)
        firstHorizStackView.addArrangedSubview(secondSquareCell)
        
        secondHorizStackView.addArrangedSubview(thirdSquareCell)
        secondHorizStackView.addArrangedSubview(fourthSquareCell)
        
        designSquare()
    }
}

private extension HobbyView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

private extension HobbyView {
    func designSquare() {
        let cells = [firstSquareCell, secondSquareCell, thirdSquareCell, fourthSquareCell]
        cells.forEach { cell in
            cell.layer.cornerRadius = 16
        }
    }
}

extension HobbyView {
    func setHobbies(_ hobbies: [HobbyStruct]) {
        let cells = [firstSquareCell, secondSquareCell, thirdSquareCell, fourthSquareCell]
        for (index, cell) in cells.enumerated() where index < hobbies.count {
            let hobby = hobbies[index]
            cell.configureText(hobbyTitle: HobbyEnum.InterfaceText.hobbyTitleLabel, personHobby: hobby.hobbyLabel, achivementTitle: HobbyEnum.InterfaceText.achivementTitleLabel, personAchivment: hobby.achivementLabel)
        }
    }
}


