import UIKit

//MARK: - Properties and init
class InfoView: UIView {
    private let infoLabel = LabelFactory.createOrdinaryLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setup UI
private extension InfoView {
    func setupView() {
        backgroundColor = .systemGray5
        addSubview(infoLabel)
    }
    
    func setupConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}

//MARK: - configure view
extension InfoView {
    func configureInfo(with data: String) {
        infoLabel.text = data
    }
    
}

