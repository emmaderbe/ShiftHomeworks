import Foundation

protocol CarListViewProtocol: AnyObject {
    func displayCars()
    func navigateToView(with car: CarStruct)
}

final class CarListPresenter {
    weak var view: CarListViewProtocol?
    private let carManager = CarManager()
    
    var cars: [CarStruct] {
        return carManager.carCatalog
    }
    
    init(view: CarListViewProtocol? = nil) {
        self.view = view
    }
}

extension CarListPresenter {
    func viewDidLoad() {
        view?.displayCars()
    }
}

extension CarListPresenter {
    func carSelected(at index: Int) {
        let selectedCar = cars[index]
        view?.navigateToView(with: selectedCar)
    }
}
