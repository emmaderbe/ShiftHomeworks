import UIKit

//MARK: - Properties and vc lifecycle
class DetailViewController: UIViewController {
    private var presenter: DetailPresenter
    private lazy var detailView = DetailView()
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        editButton()
    }
}

//MARK: - add functionality to button
private extension DetailViewController {
    func editButton() {
        detailView.buttonPressedHandler = { [weak self] in
            self?.presenter.showInfoView()
        }
    }
}

//MARK: - detail view protocol realization
extension DetailViewController: DetailViewProtocol {
    func navigateToInfoView(with index: Int) {
        let viewController = setupViewControllerToPush(index: index)
        navigationController?.pushViewController(viewController, animated: true)
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

private extension DetailViewController {
    func setupViewControllerToPush(index: Int) -> UIViewController {
        let viewModel = InfoViewModel(index: index)
        return InfoViewController(viewModel: viewModel)
    }
}
