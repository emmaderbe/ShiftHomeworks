import UIKit

class DetailView: UIView {

    private lazy var dogImage = ImageFactory.createRoundImage()
    private lazy var breedNameLabel = LabelFactory.createTitleLabel()
    private lazy var shortDescriptionLabel = LabelFactory.createOrdinaryLabel()
    private lazy var stackView = StackFactory.createVerticalStack()
    
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
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            dogImage.widthAnchor.constraint(equalTo: dogImage.heightAnchor)
        ])
    }
}

extension DetailView {
    func configure(with data: DogListData) {
        dogImage.image = UIImage(named: data.dogImage)
        breedNameLabel.text = data.breedName
        shortDescriptionLabel.text = data.shortDescription
    }
}
