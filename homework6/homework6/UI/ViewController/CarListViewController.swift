import UIKit

class CarListViewController: UIViewController {
    private let carListView = CarListView()
    private let dataSource = CarListDataSource()
    private let delegate = CarListDelegate()
    private var presenter: CarListPresenter?
    
    override func loadView() {
        view = carListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupView()
        presenter?.viewDidLoad()
    }
}

private extension CarListViewController {
    func setupPresenter() {
        presenter = CarListPresenter(view: self)
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
        presenter?.carSelected(at: index)
    }
}

extension CarListViewController: CarListViewProtocol {
    func navigateToView(with car: CarStruct) {
        let detailVC = DetailViewController(car: car)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func displayCars() {
        guard let cars = presenter?.cars else {
            print("Error: No cars to display")
            return
        }
        dataSource.updateCars(cars)
        delegate.updateCars(cars)
        carListView.reloadTableView()
    }
}
