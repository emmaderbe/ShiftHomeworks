import UIKit

//MARK: - Properties and vc lifecycle
class DetailViewController: UIViewController {
    var presenter: DetailPresenter?
    private lazy var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attachView(self)
        presenter?.viewDidLoad()
        editButton()
    }
}

//MARK: - add functionality to button
private extension DetailViewController {
    func editButton() {
        detailView.buttonPressedHandler = { [weak self] in
            self?.presenter?.showInfoView()
        }
    }
}

//MARK: - detail view protocol realization 
extension DetailViewController: DetailViewProtocol {
    func navigateToInfoView(with index: Int) {
        let viewModel = InfoViewModel(index: index)
        let infoVC = InfoViewController(viewModel: viewModel)
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    func displayDogImage(named imageName: String) {
        detailView.configureImage(with: imageName)
    }
    
    func displayBreedName(_ name: String) {
        detailView.configureBreedName(with: name)
    }
    
    func displayShortDescription(_ description: String) {
        detailView.configureDescription(with: description)
    }
    
}
