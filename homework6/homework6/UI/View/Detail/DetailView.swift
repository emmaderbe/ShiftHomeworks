import UIKit

final class DetailView: UIView {
    
    private let imageView = ImageFactory.createImage()
    
    private let priceTitleLabel = LabelFactory.createTitleLabel()
    private let priceLabel = LabelFactory.createOrdinaryLabel()
    
    private let bodyTitleLabel = LabelFactory.createTitleLabel()
    private let tableView = TableViewFactory.createTableView()
    
    private let priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorEnum.accentGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let hugeStack = StackFactory.createVerticalStack(spacing: 23)
    private let priceStack = StackFactory.createVerticalStack(spacing: 8)
    private let bodyStack = StackFactory.createVerticalStack(spacing: 8)
    
    var onPriceButtonTapped: (() -> Void)?
    
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
        addSubviews()
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
    
    func addSubviews() {
        addSubview(hugeStack)
        
        hugeStack.addArrangedSubview(imageView)
        hugeStack.addArrangedSubview(priceStack)
        hugeStack.addArrangedSubview(bodyStack)
        
        priceStack.addArrangedSubview(priceTitleLabel)
        priceStack.addArrangedSubview(priceLabel)
        
        bodyStack.addArrangedSubview(bodyTitleLabel)
        bodyStack.addArrangedSubview(tableView)
        
        addSubview(priceButton)
    }
}

private extension DetailView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hugeStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            hugeStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hugeStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hugeStack.bottomAnchor.constraint(equalTo: priceButton.topAnchor, constant: -16),
            
            imageView.heightAnchor.constraint(equalToConstant: 196),
            imageView.widthAnchor.constraint(equalToConstant: 340),
            
            priceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            priceButton.heightAnchor.constraint(equalToConstant: 51),
            priceButton.widthAnchor.constraint(equalToConstant: 343)
        ])
    }
}

extension DetailView {
    func configureText(priceTitle: String, 
                       bodyTitle: String,
                       button: String) {
        priceTitleLabel.text = priceTitle
        bodyTitleLabel.text = bodyTitle
        priceButton.setTitle(button, for: .normal)
    }
    
    func configureImage(_ image: String) {
        imageView.image = UIImage(named: image)
    }
    
    func configurePrice(_ label: String) {
        priceLabel.text = label
    }
}

extension DetailView {
    func setDataSource(_ dataSource: DetailDataSource) {
        tableView.dataSource = dataSource
    }
    
    func setDelegate(_ delegate: DetailDelegate) {
        tableView.delegate = delegate
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

