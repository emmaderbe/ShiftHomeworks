import UIKit

class ImageTableViewCell: UITableViewCell {
    private let loadImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ImageTableViewCell {
    func setupView() {
        backgroundColor = .clear
        addSubview(loadImage)
        setupConstraints()
    }
}

private extension ImageTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loadImage.topAnchor.constraint(equalTo: topAnchor),
            loadImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension ImageTableViewCell {
    //    func configureView(with data: CarStruct) {
    //        carNameLabel.text = data.brand
    //        emblemImage.image = UIImage(named: data.emblem)
    //    }
}

extension ImageTableViewCell {
    static var identifier: String {
        String(describing: ImageTableViewCell.self)
    }
}
