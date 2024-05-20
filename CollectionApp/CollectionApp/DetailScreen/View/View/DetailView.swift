import UIKit

//MARK: - Properties and init
class DetailView: UIView {
    
    private lazy var dogImage = ImageFactory.createRoundImage()
    private lazy var breedNameLabel = LabelFactory.createTitleLabel()
    private lazy var shortDescriptionLabel = LabelFactory.createOrdinaryLabel()
    private lazy var stackView = StackFactory.createVerticalStack()
    
    private lazy var openMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle(StringEnums.buttonTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = UIEnums.DetailView.cornerRadius
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateDogImageConstraints()
    }
}

//MARK: - setup UI
private extension DetailView {
    func setupView() {
        backgroundColor = .systemGray5
        addSubview(stackView)
        stackView.addArrangedSubview(dogImage)
        stackView.addArrangedSubview(breedNameLabel)
        stackView.addArrangedSubview(shortDescriptionLabel)
        
        addSubview(openMoreButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: UIEnums.DetailView.top),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: UIEnums.DetailView.leading),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: UIEnums.DetailView.trailing),
            
            openMoreButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: UIEnums.DetailView.bttnTop),
            openMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openMoreButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: UIEnums.DetailView.bttnWight),
            
            dogImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
        ])
    }
    
    private func updateDogImageConstraints() {
        let dogImageHeight = UIScreen.main.bounds.height * 0.3
        dogImage.layer.cornerRadius = dogImageHeight / 2
    }
}

//MARK: - configure view
extension DetailView {
    func configureImage(with data: String) {
        dogImage.image = UIImage(named: data)
    }
    
    func configureBreedName(with data: String) {
        breedNameLabel.text = data
    }
    
    func configureDescription(with data: String) {
        shortDescriptionLabel.text = data
    }
}

//MARK: - button pressed
private extension DetailView {
    @objc func buttonPressed() {
        buttonPressedHandler?()
    }
}
