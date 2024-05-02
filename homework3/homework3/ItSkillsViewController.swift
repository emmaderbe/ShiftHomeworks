import UIKit

class ItSkillsViewController: UIViewController {
    private let itSkillsStruct = ItSkillsStruct(experienceLabel: """
                                                Я занимаюсь разработкой iOS-приложений c середины 2022 года. За это время моё портфолио пополнилось не только учебными проектами, но и реальным приложением, которое теперь доступно в AppStore.
                                                """,
                                                expectationsLabel: """
                                                Жду от обучения шанса отшлифовать и систематизировать все накопленные знания. Мне очень нравится система домашних заданий с обратной связью от опытных разработчиков — это помогает мне не только решать сложные задачи, но и, я надеюсь, подготовит меня к карьере в компании, где ценят стремление к росту и увлеченность :)
                                                """,
                                                jokeImage: "joke")
    private let itSkillsView = ItSkillsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

private extension ItSkillsViewController {
    func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(itSkillsView)
        itSkillsView.layer.cornerRadius = 16
        itSkillsView.configureImage(image: itSkillsStruct.jokeImage)
        setupText()
    }
}

private extension ItSkillsViewController {
    func setupText() {
        itSkillsView.configureText(experienceTitle: ItSkillsEnum.InterfaceText.experienceTitleLabel, 
                                   personExperience: itSkillsStruct.experienceLabel,
                                   expectationsTitle: ItSkillsEnum.InterfaceText.expectationsTitleLabel,
                                   personExpectations: itSkillsStruct.expectationsLabel,
                                   jokeTitle: ItSkillsEnum.InterfaceText.jokeTitleLabel)
    }
}

private extension ItSkillsViewController {
    func setupConstraints() {
        itSkillsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itSkillsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ItSkillsEnum.ViewControllerConstraints.topConst),
            itSkillsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ItSkillsEnum.ViewControllerConstraints.leadingConst),
            itSkillsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ItSkillsEnum.ViewControllerConstraints.trailingConst),
            itSkillsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: ItSkillsEnum.ViewControllerConstraints.bottomConst)
        ])
    }
}
