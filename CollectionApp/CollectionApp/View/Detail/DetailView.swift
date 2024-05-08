import UIKit

class DetailView: UIView {
    
    private lazy var dogImage = ImageFactory.createRoundImage()
    private lazy var breedNameLabel = LabelFactory.createTitleLabel()
    private lazy var shortDescriptionLabel = LabelFactory.createOrdinaryLabel()
    private lazy var stackView = StackFactory.createVerticalStack()
    
    private lazy var openMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подробнее", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonPressedHandler: (() -> Void)?
    
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

private extension DetailView {
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(dogImage)
        stackView.addArrangedSubview(breedNameLabel)
        stackView.addArrangedSubview(shortDescriptionLabel)
        
        addSubview(openMoreButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            openMoreButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            openMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openMoreButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4),
            
            dogImage.widthAnchor.constraint(equalTo: dogImage.heightAnchor),
            
        ])
    }
}

extension DetailView {
    func configure(with data: DogListData) {
        dogImage.image = UIImage(named: data.dogImage)
        breedNameLabel.text = data.breedName
        shortDescriptionLabel.text = data.shortDescription
    }
    
    @objc func buttonPressed() {
        buttonPressedHandler?()
    }
}
