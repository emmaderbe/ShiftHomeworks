import UIKit

//MARK: - Property and init
final class DogListCollectionViewCell: UICollectionViewCell {
    
    private lazy var godImage = ImageFactory.createRoundImage()
    private lazy var breedNameLabel = LabelFactory.createTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        godImage.layer.cornerRadius = godImage.bounds.height / 2
    }
}

//MARK: - setup UI
private extension DogListCollectionViewCell {
    func setupCell() {
        backgroundColor = .white
        layer.cornerRadius = UIEnums.DogListCell.cornerRadius
        
        addSubview(godImage)
        addSubview(breedNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            godImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            godImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIEnums.DogListCell.leading),
            godImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            godImage.heightAnchor.constraint(equalTo: godImage.widthAnchor),
            
            breedNameLabel.centerYAnchor.constraint(equalTo: godImage.centerYAnchor),
            breedNameLabel.leadingAnchor.constraint(equalTo: godImage.trailingAnchor, constant: UIEnums.DogListCell.leading),
            breedNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: UIEnums.DogListCell.trailing),
        ])
    }
    
}

//MARK: - configure cell
extension DogListCollectionViewCell {
    func configure(with data: DogListData) {
        godImage.image = UIImage(named: data.dogImage)
        breedNameLabel.text = data.breedName
    }
}

//MARK: - sidentifier of cell
extension DogListCollectionViewCell {
    static var identifier: String {
        String(describing: DogListCollectionViewCell.self)
    }
}
