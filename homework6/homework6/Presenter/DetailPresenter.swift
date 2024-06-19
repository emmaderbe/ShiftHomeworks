import Foundation

protocol DetailViewProtocol: AnyObject {
    func displayCarBodyTypes()
    func displayPrice(price: String)
    func displayImage(imageName: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func selectDefaultBodyType(index: Int)
}

protocol DetailPresenterProtocol: AnyObject {
    var bodyTypes: [String] { get }
    func didSelectBodyType(at index: Int)
    func calculatePrice()
}


final class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    private let car: CarStruct
    private let carManager: CarManagerProtocol
    private var selectedBodyType: String?
    
    init(car: CarStruct, carManager: CarManagerProtocol = CarManager()) {
        self.car = car
        self.carManager = carManager
    }
    
    var bodyTypes: [String] {
        return carManager.getSortedBodyTypes(for: car)
    }
    
    var carBrand: String {
        return car.brand
    }
}

private extension DetailPresenter {
    private func loadDefaultBodyTypeDetails() {
        guard let defaultBodyType = bodyTypes.first,
              let details = carManager.getBodyTypeDetails(for: car, byName: defaultBodyType) else { return }
        selectedBodyType = defaultBodyType
        view?.displayPrice(price: details.price)
        view?.displayImage(imageName: details.photo)
        view?.selectDefaultBodyType(index: 0)
    }
}


extension DetailPresenter {
    func viewDidLoad(view: DetailViewProtocol) {
        self.view = view
        view.showLoadingIndicator()
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { [weak self] in
            DispatchQueue.main.async {
                self?.view?.hideLoadingIndicator()
                self?.view?.displayCarBodyTypes()
                self?.loadDefaultBodyTypeDetails()
            }
        }
    }
}

extension DetailPresenter {
    func didSelectBodyType(at index: Int) {
        let selectedBodyType = bodyTypes[index]
        self.selectedBodyType = selectedBodyType
        if let details = carManager.getBodyTypeDetails(for: car, byName: selectedBodyType) {
            view?.displayImage(imageName: details.photo)
        }
    }
}

extension DetailPresenter {
    func calculatePrice() {
        guard let selectedBodyType = selectedBodyType,
              let details = carManager.getBodyTypeDetails(for: car, byName: selectedBodyType) else { return }
        view?.displayPrice(price: details.price)
    }
}

