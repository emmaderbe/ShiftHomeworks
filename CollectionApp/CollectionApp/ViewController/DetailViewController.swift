import UIKit
import SafariServices

class DetailViewController: UIViewController {
    var selectedDog: DogListData?
    private lazy var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension DetailViewController {
    func setupView() {
        view.backgroundColor = .systemGray5
        setupData()
        setupButton()
    }
    
    func setupData() {
        if let selectedDog = selectedDog {
            detailView.configure(with: selectedDog)
        }
    }
}

private extension DetailViewController {
    func setupButton() {
        detailView.buttonPressedHandler = { [weak self] in
                    guard let selectedDog = self?.selectedDog else { return }
                    if let url = URL(string: selectedDog.fullDescription) {
                        let safariVC = SFSafariViewController(url: url)
                        self?.present(safariVC, animated: true, completion: nil)
                    } else {
                        self?.showAlert(message: "Не удалось открыть ссылку. Пожалуйста, попробуйте позже или проверьте правильность адреса URL.")
                    }
                }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
