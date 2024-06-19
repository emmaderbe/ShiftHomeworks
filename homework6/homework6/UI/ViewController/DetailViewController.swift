import UIKit

class DetailViewController: UIViewController {
    private let detailView = DetailView()
    private var dataSource = DetailDataSource()
    private let delegate = DetailDelegate()
    private var presenter: DetailPresenter
//    private let car: CarStruct
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
        setupButton()
    }
}

private extension DetailViewController {
    func setupView() {
        detailView.configureCarTitle(presenter.carBrand)
        detailView.configureText(priceTitle: "Цена",
                                 bodyTitle: "Выберите тип кузова",
                                 button: "Рассчитать цену")
        setupDataSource()
        setupDelegate()
    }
    
    func setupDataSource() {
        detailView.setDataSource(dataSource)
    }
    
    func setupDelegate() {
        delegate.delegate = self
        detailView.setDelegate(delegate)
    }
}

private extension DetailViewController {
    func setupButton() {
        detailView.onPriceButtonTapped = { [weak self] in
            self?.presenter.calculatePrice()
        }
    }
}

extension DetailViewController: DetailViewProtocol {
    func selectDefaultBodyType(index: Int) {
        dataSource.selectBodyType(at: index)
        detailView.reloadTableView()
    }
    
    func showLoadingIndicator() {
        detailView.showLoadingIndicator()
    }
    
    func hideLoadingIndicator() {
        detailView.hideLoadingIndicator()
    }
    
    func displayCarBodyTypes() {
        let bodyTypes = presenter.bodyTypes
        dataSource.updateBodyTypes(bodyTypes)
        delegate.updateBodyTypes(bodyTypes)
        detailView.reloadTableView()
    }
    
    func displayPrice(price: String) {
        detailView.configurePrice(price)
    }
    
    func displayImage(imageName: String) {
        detailView.configureImage(imageName)
    }
}

extension DetailViewController: DetailDelegateProtocol {
    func bodyTypeSelected(at index: Int) {
        presenter.didSelectBodyType(at: index)
        dataSource.selectBodyType(at: index)
        detailView.reloadTableView()
    }
}
