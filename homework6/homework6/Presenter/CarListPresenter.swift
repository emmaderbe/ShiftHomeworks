import Foundation

protocol CarListViewProtocol: AnyObject {
    func displayCars()
    func navigateToView(with car: CarStruct)
}

final class CarListPresenter {
    weak var view: CarListViewProtocol?
    private let carManager: CarManagerProtocol
    
    var cars: [CarStruct] {
        return carManager.carCatalog
    }
    
    init(carManager: CarManagerProtocol = CarManager()) {
        self.carManager = carManager
    }
}

extension CarListPresenter {
    func viewDidLoad(view: CarListViewProtocol) {
        self.view = view
        view.displayCars()
    }
}

extension CarListPresenter {
    func carSelected(at index: Int) {
        let selectedCar = cars[index]
        view?.navigateToView(with: selectedCar)
    }
}
