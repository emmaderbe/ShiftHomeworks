import UIKit

final class DetailView: UIView {
    private let carTitle = LabelFactory.createTitleLabel()
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
        button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = ConstEnum.DetailView.priceButtonRadius
        return button
    }()
    
    private let hugeStack = StackFactory.createVerticalStack(spacing: 23)
    private let priceStack = StackFactory.createVerticalStack(spacing: 8)
    private let bodyStack = StackFactory.createVerticalStack(spacing: 8)
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
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
        carTitle.textAlignment = .center
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
    
    func addSubviews() {
        addSubview(hugeStack)
        
        hugeStack.addArrangedSubview(carTitle)
        hugeStack.addArrangedSubview(imageView)
        hugeStack.addArrangedSubview(priceStack)
        hugeStack.addArrangedSubview(bodyStack)
        
        priceStack.addArrangedSubview(priceTitleLabel)
        priceStack.addArrangedSubview(priceLabel)
        
        bodyStack.addArrangedSubview(bodyTitleLabel)
        bodyStack.addArrangedSubview(tableView)
        
        addSubview(priceButton)
        addSubview(activityIndicator)
    }
}

private extension DetailView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hugeStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            hugeStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstEnum.DetailView.leading),
            hugeStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ConstEnum.DetailView.trailing),
            hugeStack.bottomAnchor.constraint(equalTo: priceButton.topAnchor, constant: ConstEnum.DetailView.bottom),
            
            imageView.heightAnchor.constraint(equalToConstant: ConstEnum.DetailView.imageHeight),
            imageView.widthAnchor.constraint(equalToConstant: ConstEnum.DetailView.imageWidth),
            
            priceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ConstEnum.DetailView.priceButtom),
            priceButton.heightAnchor.constraint(equalToConstant: ConstEnum.DetailView.priceButtonHeight),
            priceButton.widthAnchor.constraint(equalToConstant: ConstEnum.DetailView.priceButtonWidth),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

private extension DetailView {
    @objc func priceButtonTapped() {
        onPriceButtonTapped?()
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
    
    func configureCarTitle(_ title: String) {
        carTitle.text = title
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

extension DetailView {
    func showLoadingIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.stopAnimating()
    }
}
