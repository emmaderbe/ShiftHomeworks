import UIKit

class CarListViewController: UIViewController {
    private let carListView = CarListView()
    private let dataSource = CarListDataSource()
    private let delegate = CarListDelegate()
    private var presenter: CarListPresenter
    
    init(presenter: CarListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = carListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension CarListViewController {
    func setupView() {
        carListView.configureText(title: "Выберите марку машины")
        setupDataSource()
        setupDelegate()
    }
    
    func setupDataSource() {
        carListView.setDataSource(dataSource)
    }
    
    func setupDelegate() {
        delegate.delegate = self
        carListView.setDelegates(delegate)
    }
}

extension CarListViewController: CarListDelegateProtocol {
    func carSelected(at index: Int) {
        presenter.carSelected(at: index)
    }
}

extension CarListViewController: CarListViewProtocol {
    func navigateToView(with car: CarStruct) {
        let presenter = DetailPresenter(car: car)
        let detailVC = DetailViewController(presenter: presenter)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func displayCars() {
        let cars = presenter.cars
        dataSource.updateCars(cars)
        delegate.updateCars(cars)
        carListView.reloadTableView()
    }
}
