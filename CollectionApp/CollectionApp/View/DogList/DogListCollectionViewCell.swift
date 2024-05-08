import UIKit

//MARK: - Property and init
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

//MARK: - setup UI
private extension DogListCollectionViewCell {
    func setupCell() {
        backgroundColor = .white
        layer.cornerRadius = UIEnums.DogListCell.cornerRadius
        
        addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(godImage)
        verticalStack.addArrangedSubview(breedNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: UIEnums.DogListCell.top),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIEnums.DogListCell.leading),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: UIEnums.DogListCell.trailing),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UIEnums.DogListCell.bottom),
            
            godImage.widthAnchor.constraint(equalTo: godImage.heightAnchor),
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
