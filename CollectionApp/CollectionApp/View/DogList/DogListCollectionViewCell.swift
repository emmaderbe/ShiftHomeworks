import UIKit

final class DogListCollectionViewCell: UICollectionViewCell {
    
    private lazy var godImage = ImageFactory.createRoundImage()
    private lazy var breedNameLabel = LabelFactory.createTitleLabel()
    private lazy var verticalStack = StackFactory.createVerticalStack()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DogListCollectionViewCell {
    func setupCell() {
        backgroundColor = .white
        layer.cornerRadius = 16
        
        addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(godImage)
        verticalStack.addArrangedSubview(breedNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            godImage.widthAnchor.constraint(equalTo: godImage.heightAnchor),
        ])
    }
    
}

extension DogListCollectionViewCell {
    func configure(with data: DogListData) {
        godImage.image = UIImage(named: data.dogImage)
        breedNameLabel.text = data.breedName
    }
}

extension DogListCollectionViewCell {
    static var identifier: String {
        String(describing: DogListCollectionViewCell.self)
    }
}
