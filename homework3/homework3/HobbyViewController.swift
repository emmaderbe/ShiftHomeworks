import UIKit

class HobbyViewController: UIViewController {
    private let hobbyView = HobbyView()
    private let hobbyStruct: [HobbyStruct] = [
        HobbyStruct(hobbyLabel: "Дегустировать кофе", achivementLabel: "Достигла уровня, когда в кофейнях говорят «как всегда?»"),
        HobbyStruct(hobbyLabel: "Получать окситоцин", achivementLabel: "Мои собаки - чемпионы по количеству получаемых массажей"),
        HobbyStruct(hobbyLabel: "Наслаждаться долгими пешими прогулками", achivementLabel: "Фраза «давай пойдем погуляем» пугает друзей"),
        HobbyStruct(hobbyLabel: "Представлять себя кинокритиком ", achivementLabel: "Накопленный мною «сериальный стаж» составляет 97 дней")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

private extension HobbyViewController {
    func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(hobbyView)
        setupText()
    }
    
}

private extension HobbyViewController {
    func setupConstraints() {
        hobbyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hobbyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: HobbyEnum.ViewControllerConstraints.topConst),
            hobbyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: HobbyEnum.ViewControllerConstraints.leadingConst),
            hobbyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: HobbyEnum.ViewControllerConstraints.trailingConst),
            hobbyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: HobbyEnum.ViewControllerConstraints.bottomConst)
        
        ])
    }
}

private extension HobbyViewController {
    func setupText() {
        hobbyView.setHobbies(hobbyStruct)
    }
}
