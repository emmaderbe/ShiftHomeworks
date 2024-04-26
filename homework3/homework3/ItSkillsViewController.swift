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

extension ItSkillsViewController {
    private func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(itSkillsView)
        itSkillsView.layer.cornerRadius = 16
        itSkillsView.jokeImage.image = UIImage(named: itSkillsStruct.jokeImage)
        setupText()
    }
}

extension ItSkillsViewController {
    private func setupText() {
        itSkillsView.experienceTitleLabel.text = ItSkillsEnum.experienceTitleLabel.rawValue
        itSkillsView.expectationsTitleLabel.text = ItSkillsEnum.expectationsTitleLabel.rawValue
        itSkillsView.expectationsTitleLabel.text = ItSkillsEnum.expectationsTitleLabel.rawValue
        itSkillsView.jokeTitleLabel.text = ItSkillsEnum.jokeTitleLabel.rawValue
        
        itSkillsView.experienceLabel.text = itSkillsStruct.experienceLabel
        itSkillsView.expectationsLabel.text = itSkillsStruct.expectationsLabel
    }
}

extension ItSkillsViewController {
    private func setupConstraints() {
        itSkillsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itSkillsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            itSkillsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itSkillsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            itSkillsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
