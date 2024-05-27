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
        accessoryType = .detailDisclosureButton
        addSubview(emblemImage)
        addSubview(carNameLabel)
        
        setupConstraints()
    }
}

private extension CarListTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emblemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            emblemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emblemImage.heightAnchor.constraint(equalToConstant: 16 * 2),
            emblemImage.widthAnchor.constraint(equalToConstant: 16 * 2),
            
            carNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            carNameLabel.leadingAnchor.constraint(equalTo: emblemImage.trailingAnchor, constant: 16),
        ])
    }
}

extension CarListTableViewCell {
    func configureView(with data: CarStruct) {
        carNameLabel.text = data.brand
        emblemImage.image = UIImage(named: data.emblem)
    }
}

extension CarListTableViewCell {
    static var identifier: String {
        String(describing: CarListTableViewCell.self)
    }
}
