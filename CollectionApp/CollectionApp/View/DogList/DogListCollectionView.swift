import UIKit

//MARK: - Property and init
class DogListCollectionView: UIView {
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.isUserInteractionEnabled = true
        collectionView.register(DogListCollectionViewCell.self, forCellWithReuseIdentifier: DogListCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
  
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
private extension DogListCollectionView {
    func setupView() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo:
                    bottomAnchor),
        ])
    }
}

//MARK: - create Layout
private extension DogListCollectionView {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(UIEnums.DogListCollectionView.spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = UIEnums.DogListCollectionView.spacing
        section.contentInsets = .init(top: UIEnums.DogListCollectionView.sectionTop, leading: UIEnums.DogListCollectionView.sectionLeading, bottom: UIEnums.DogListCollectionView.sectionBottom, trailing: UIEnums.DogListCollectionView.sectionTrailing)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//MARK: - set dataSource and delegate
extension DogListCollectionView {
    func setDataSource(_ dataSource: DogListCollectionDataSource) {
        collectionView.dataSource = dataSource
    }
    
    func setDelegates(_ delegate: DogListCollectionDelegate) {
        collectionView.delegate = delegate
    }
    
}

