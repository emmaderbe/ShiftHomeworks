import UIKit

class ItSkillsView: UIView {    
    let experienceTitleLabel = UILabel.createTitleLabel()
    let experienceLabel = UILabel.createOrdinaryLabel()
    let expectationsTitleLabel = UILabel.createTitleLabel()
    let expectationsLabel = UILabel.createOrdinaryLabel()
    let jokeTitleLabel = UILabel.createTitleLabel()
    
    let jokeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.systemGray6.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItSkillsView {
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(experienceTitleLabel)
        stackView.addArrangedSubview(experienceLabel)
        stackView.addArrangedSubview(expectationsTitleLabel)
        stackView.addArrangedSubview(expectationsLabel)
        stackView.addArrangedSubview(jokeTitleLabel)
        stackView.addArrangedSubview(jokeImage)
    }
}

extension ItSkillsView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            jokeImage.heightAnchor.constraint(equalTo: jokeImage.widthAnchor)
        ])
    }
}

