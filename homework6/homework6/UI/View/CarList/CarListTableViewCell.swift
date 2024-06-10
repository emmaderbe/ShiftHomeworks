import UIKit

class CarListTableViewCell: UITableViewCell {
    private let emblemImage = ImageFactory.createImage()
    private let carNameLabel = LabelFactory.createOrdinaryLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CarListTableViewCell {
    func setupView() {
        backgroundColor = ColorEnum.accentBackground
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        addSubview(emblemImage)
        addSubview(carNameLabel)
        
        setupConstraints()
        setupImage()
    }
    
    func setupImage() {
        emblemImage.backgroundColor = ColorEnum.accentGreen
        emblemImage.layer.cornerRadius = ConstEnum.CarListView.imageRadius
    }
}

private extension CarListTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emblemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            emblemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstEnum.CarListView.leading),
            emblemImage.heightAnchor.constraint(equalToConstant: ConstEnum.CarListView.imageSize),
            emblemImage.widthAnchor.constraint(equalToConstant: ConstEnum.CarListView.imageSize),
            
            carNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            carNameLabel.leadingAnchor.constraint(equalTo: emblemImage.trailingAnchor, constant: ConstEnum.CarListView.leading),
        ])
    }
}

extension CarListTableViewCell {
    func configureView(with data: CarStruct) {
        carNameLabel.text = data.brand
    }
}

extension CarListTableViewCell {
    static var identifier: String {
        String(describing: CarListTableViewCell.self)
    }
}
