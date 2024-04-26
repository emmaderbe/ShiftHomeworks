import UIKit

class HobbyViewController: UIViewController {
    private let hobbyView = HobbyView()
    private let firstHobbyStruct = HobbyStruct(hobbyLabel: "Дегустировать кофе", achivementLabel: "Достигла уровня, когда в кофейнях говорят «как всегда?»")
    private let secondHobbyStruct = HobbyStruct(hobbyLabel: "Получать окситоцин", achivementLabel: "Мои собаки - чемпионы по количеству получаемых массажей")
    private let thirdHobbyStruct = HobbyStruct(hobbyLabel: "Наслаждаться долгими пешими прогулками", achivementLabel: "Фраза «давай пойдем погуляем» пугает друзей")
    private let fourthHobbyStruct = HobbyStruct(hobbyLabel: "Представлять себя кинокритиком ", achivementLabel: "Накопленный мною «сериальный стаж» составляет 97 дней")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

extension HobbyViewController {
    private func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(hobbyView)
        setupText()
    }
    
}

extension HobbyViewController {
    private func setupConstraints() {
        hobbyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hobbyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hobbyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hobbyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hobbyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        
        ])
    }
}

extension HobbyViewController {
    private func setupText() {
        hobbyView.firstHobbyCell.hobbyTitleLabel.text = HobbyEnum.hobbyTitleLabel.rawValue
        hobbyView.firstHobbyCell.hobbyLabel.text = firstHobbyStruct.hobbyLabel
        hobbyView.firstHobbyCell.achivementTitleLabel.text = HobbyEnum.achivementTitleLabel.rawValue
        hobbyView.firstHobbyCell.achivementLabel.text = firstHobbyStruct.achivementLabel
        
        hobbyView.secondHobbyCell.hobbyTitleLabel.text = HobbyEnum.hobbyTitleLabel.rawValue
        hobbyView.secondHobbyCell.hobbyLabel.text = secondHobbyStruct.hobbyLabel
        hobbyView.secondHobbyCell.achivementTitleLabel.text = HobbyEnum.achivementTitleLabel.rawValue
        hobbyView.secondHobbyCell.achivementLabel.text = secondHobbyStruct.achivementLabel
        
        hobbyView.thirdHobbyCell.hobbyTitleLabel.text = HobbyEnum.hobbyTitleLabel.rawValue
        hobbyView.thirdHobbyCell.hobbyLabel.text = thirdHobbyStruct.hobbyLabel
        hobbyView.thirdHobbyCell.achivementTitleLabel.text = HobbyEnum.achivementTitleLabel.rawValue
        hobbyView.thirdHobbyCell.achivementLabel.text = thirdHobbyStruct.achivementLabel
        
        hobbyView.fourthHobbyCell.hobbyTitleLabel.text = HobbyEnum.hobbyTitleLabel.rawValue
        hobbyView.fourthHobbyCell.hobbyLabel.text = fourthHobbyStruct.hobbyLabel
        hobbyView.fourthHobbyCell.achivementTitleLabel.text = HobbyEnum.achivementTitleLabel.rawValue
        hobbyView.fourthHobbyCell.achivementLabel.text = fourthHobbyStruct.achivementLabel
    }
}
