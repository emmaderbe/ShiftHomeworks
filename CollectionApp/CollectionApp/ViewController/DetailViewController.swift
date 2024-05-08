import UIKit
import SafariServices

//MARK: - Properties and vc lifecycle
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

//MARK: - setupUI
private extension DetailViewController {
    func setupView() {
        view.backgroundColor = .systemGray5
        setupData()
        setupButton()
    }
}

//MARK: - setupData
private extension DetailViewController {
    func setupData() {
        if let selectedDog = selectedDog {
            detailView.configure(with: selectedDog)
        }
    }
}

//MARK: - add functionality to button + alert
private extension DetailViewController {
    func setupButton() {
        detailView.buttonPressedHandler = { [weak self] in
                    guard let selectedDog = self?.selectedDog else { return }
                    if let url = URL(string: selectedDog.fullDescription) {
                        let safariVC = SFSafariViewController(url: url)
                        self?.present(safariVC, animated: true, completion: nil)
                    } else {
                        self?.showAlert(message: StringEnums.alertMessage)
                    }
                }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: StringEnums.alertClose, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
