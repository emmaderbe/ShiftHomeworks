import UIKit

class HobbySquareView: UIView {
    private let hobbyTitleLabel = LabelFactory.createTitleLabel()
    private let hobbyLabel = LabelFactory.createOrdinaryLabel()
    private let achivementTitleLabel = LabelFactory.createTitleLabel()
    private let achivementLabel = LabelFactory.createOrdinaryLabel()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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

private extension HobbySquareView {
    func setupView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.addArrangedSubview(hobbyTitleLabel)
        stackView.addArrangedSubview(hobbyLabel)
        stackView.addArrangedSubview(achivementTitleLabel)
        stackView.addArrangedSubview(achivementLabel)
        }
}

private extension HobbySquareView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: HobbyEnum.SquareViewConstraints.topConst),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: HobbyEnum.SquareViewConstraints.leadingConst),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: HobbyEnum.SquareViewConstraints.trailingConst),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: HobbyEnum.SquareViewConstraints.bottomConst),
        ])
    }
}

extension HobbySquareView {
    func configureText(hobbyTitle: String, 
                       personHobby: String,
                       achivementTitle: String,
                       personAchivment: String) {
        hobbyTitleLabel.text = hobbyTitle
        hobbyLabel.text = personHobby
        achivementTitleLabel.text = achivementTitle
        achivementLabel.text = personAchivment
    }
}
