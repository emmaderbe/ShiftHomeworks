import UIKit

class DetailView: UIView {
    
    private let imageView = ImageFactory.createImage()
    
    private let priceTitleLabel = LabelFactory.createTitleLabel()
    private let priceLabel = LabelFactory.createOrdinaryLabel()
    
    private let bodyTitleLabel = LabelFactory.createTitleLabel()
    private let tableView = TableViewFactory.createTableView()
    
    private let priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorEnum.accentGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let hugeStack = StackFactory.createVerticalStack(spacing: 23)
    private let priceStack = StackFactory.createVerticalStack(spacing: 8)
    private let bodyStack = StackFactory.createVerticalStack(spacing: 8)
    
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

private extension DetailView {
    func setupView() {
        backgroundColor = ColorEnum.accentBackground
        addSubview(hugeStack)
        
        hugeStack.addArrangedSubview(imageView)
        hugeStack.addArrangedSubview(priceStack)
        hugeStack.addArrangedSubview(bodyStack)
        
        priceStack.addArrangedSubview(priceTitleLabel)
        priceStack.addArrangedSubview(priceLabel)
        
        bodyStack.addArrangedSubview(bodyTitleLabel)
        bodyStack.addArrangedSubview(tableView)

        addSubview(priceButton)
        
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
}

private extension DetailView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hugeStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            hugeStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hugeStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            hugeStack.bottomAnchor.constraint(equalTo: priceButton.topAnchor, constant: -16),
            
            priceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
        ])
    }
}

extension DetailView {
    func configureText(priceTitle: String, bodyTitle: String, button: String) {
        priceTitleLabel.text = priceTitle
        bodyTitleLabel.text = bodyTitle
        priceButton.setTitle(button, for: .normal)
    }
    
//    func configureWithData(_ data: BodyType) {
//        priceLabel.text = data.price
//        imageView.image = UIImage(named: data.photo)
//    }
}

