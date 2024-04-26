import UIKit

class HobbyCellView: UIView {
    let hobbyTitleLabel = UILabel.createTitleLabel()
    let hobbyLabel = UILabel.createOrdinaryLabel()
    let achivementTitleLabel = UILabel.createTitleLabel()
    let achivementLabel = UILabel.createOrdinaryLabel()
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HobbyCellView {
    private func setupView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.addArrangedSubview(hobbyTitleLabel)
        stackView.addArrangedSubview(hobbyLabel)
        stackView.addArrangedSubview(achivementTitleLabel)
        stackView.addArrangedSubview(achivementLabel)
        }
}

extension HobbyCellView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
