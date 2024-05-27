import UIKit

class DetailViewController: UIViewController {
    private let detailView = DetailView()
    private var dataSource = DetailDataSource()
    private let delegate = DetailDelegate()
    private var presenter: DetailPresenter?
    private let car: CarStruct
    
    init(car: CarStruct) {
        self.car = car
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
        setupPresenter()
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupPresenter() {
        presenter = DetailPresenter(view: self, car: car)
    }
    
    private func setupView() {
        detailView.configureText(priceTitle: "priceTitle",
                                 bodyTitle: "bodyTitle",
                                 button: "Рассчитать смтоимость")
        detailView.setDataSource(dataSource)
        setupDelegate()
        setupButton()
    }
    
    private func setupButton() {
        detailView.onPriceButtonTapped = { [weak self] in
            self?.presenter?.calculatePrice()
        }
    }
    
    private func setupDelegate() {
        delegate.delegate = self
        detailView.setDelegate(delegate)
    }
    
    @objc private func priceButtonTapped() {
        presenter?.calculatePrice()
    }
}

extension DetailViewController: DetailViewProtocol {
    func displayCarBodyTypes() {
        guard let bodyTypes = presenter?.bodyTypes else {
            print("Error: No body types to display")
            return
        }
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
        presenter?.didSelectBodyType(at: index)
    }
}

