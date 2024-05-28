import UIKit

final class DetailTableViewCell: UITableViewCell {
    private let bodyTypeLabel = LabelFactory.createOrdinaryLabel()
    private let roundButton: UIButton = {
        let button = UIButton()
        button.tintColor = ColorEnum.accentGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DetailTableViewCell {
    func setupView() {
        backgroundColor = ColorEnum.accentBackground
        selectionStyle = .none
        addSubview(bodyTypeLabel)
        addSubview(roundButton)
        
        setupConstraints()
    }
}

private extension DetailTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bodyTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bodyTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            roundButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            roundButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            roundButton.widthAnchor.constraint(equalToConstant: 20),
            roundButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension DetailTableViewCell {
    func configureView(with bodyType: String, isSelected: Bool) {
        bodyTypeLabel.text = bodyType
        let imageName = isSelected ? "checkmark.circle.fill" : "circle"
        roundButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

extension DetailTableViewCell {
    static var identifier: String {
        String(describing: CarListTableViewCell.self)
    }
}

