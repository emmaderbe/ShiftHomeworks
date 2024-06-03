import UIKit

class SearchViewController: UIViewController {
    private let searchView = SearchView()
    private let tableViewDataSource = ImageTableViewDataSource()
    private let tableViewDelegate = ImageTableViewDelegate()
    private let networkService: NetworkServiceProtocol
    private let imageLoader: ImageLoaderProtocol
    
    
    init(networkService: NetworkServiceProtocol = NetworkService(), imageLoader: ImageLoaderProtocol = ImageLoader()) {
        self.networkService = networkService
        self.imageLoader = imageLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension SearchViewController {
    func setupView() {
        setupTableView()
        searchView.configureText(searchPlaceholder: "Напишите, что вы хотите найти")
        setupImageLoader()
    }
    
    func setupTableView() {
        searchView.setDelegate(tableViewDelegate)
        searchView.setDataSource(tableViewDataSource)
        searchView.delegate = self
    }
    
    func setupImageLoader() {
        tableViewDataSource.setupLoader(imageLoader)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ок", style: .default))
        present(alertController, animated: true)
    }
}

extension SearchViewController: SearchViewDelegate {
    func selectSeachBar(with text: String) {
        networkService.fetchPhotos(query: text) { [weak self] result in
            switch result {
            case .success(let results):
                self?.tableViewDataSource.addResults(results)
                self?.searchView.reloadTableView()
            case .failure(let error):
                let errorMessage: String
                switch error {
                case NetworkError.noResults:
                    errorMessage = ErrorMessageEnum.noResults
                case NetworkError.invalidURL:
                    errorMessage = ErrorMessageEnum.invalidURL
                case NetworkError.clientError:
                    errorMessage = ErrorMessageEnum.clientError
                case NetworkError.serverError:
                    errorMessage = ErrorMessageEnum.serverError
                default:
                    errorMessage = ErrorMessageEnum.defaultError
                }
                self?.showAlert(title: ErrorMessageEnum.title, message: errorMessage)
            }
        }
    }
}



