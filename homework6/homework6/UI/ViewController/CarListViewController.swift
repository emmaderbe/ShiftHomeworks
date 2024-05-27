import UIKit

class CarListViewController: UIViewController {
    private let carListView = CarListView()
    private let dataSource = CarListDataSource()
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
        presenter?.attachView(self)
    }
}

private extension CarListViewController {
    func setupView() {
        carListView.configureText(title: "Выберите марку машины")
        carListView.setDataSource(dataSource)
    }
}

extension CarListViewController: CarListViewProtocol {
    func displayCars() {
        dataSource.updateCars(presenter?.cars ?? [])
        carListView.reloadTableView()
    }
}
