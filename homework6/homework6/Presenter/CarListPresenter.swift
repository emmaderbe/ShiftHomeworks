import Foundation

protocol CarListViewProtocol: AnyObject {
    func displayCars()
}

final class CarListPresenter {
    weak var view: CarListViewProtocol?
    private let carManager: CarManager
    
    init(view: CarListViewProtocol, carManager: CarManager = CarManager()) {
        self.view = view
        self.carManager = carManager
    }
    
    var cars: [CarStruct] {
        return carManager.carCatalog
    }
    
    func attachView(_ view: CarListViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayCars()
    }
}

