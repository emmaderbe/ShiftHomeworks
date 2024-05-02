import UIKit

class ItSkillsView: UIView {    
    private let experienceTitleLabel = LabelFactory.createTitleLabel()
    private let experienceLabel = LabelFactory.createOrdinaryLabel()
    private let expectationsTitleLabel = LabelFactory.createTitleLabel()
    private let expectationsLabel = LabelFactory.createOrdinaryLabel()
    private let jokeTitleLabel = LabelFactory.createTitleLabel()
    
    private let jokeImage: UIImageView = {
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
    
    private let stackView = StackFactory.createVerticalStack()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ItSkillsView {
    func setupView() {
        backgroundColor = .white
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

private extension ItSkillsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: ItSkillsEnum.ViewConstraints.topConst),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ItSkillsEnum.ViewConstraints.leadingConst),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ItSkillsEnum.ViewConstraints.trailingConst),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: ItSkillsEnum.ViewConstraints.bottomConst),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            jokeImage.heightAnchor.constraint(equalTo: jokeImage.widthAnchor)
        ])
    }
}

extension ItSkillsView {
    func configureText(experienceTitle: String, 
                       personExperience: String,
                       expectationsTitle: String,
                       personExpectations: String,
                       jokeTitle: String) {
        experienceTitleLabel.text = experienceTitle
        experienceLabel.text = personExperience
        expectationsTitleLabel.text = expectationsTitle
        expectationsLabel.text = personExpectations
        jokeTitleLabel.text = jokeTitle
    }
    
    func configureImage(image: String) {
        jokeImage.image = UIImage(named: image)
    }
}

