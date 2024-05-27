import Foundation

protocol DetailViewProtocol: AnyObject {
    func displayCarBodyTypes()
    func displayPrice(price: String)
    func displayImage(imageName: String)
}

protocol DetailPresenterProtocol: AnyObject {
    var bodyTypes: [String] { get }
    func viewDidLoad()
    func didSelectBodyType(at index: Int)
    func calculatePrice()
}

final class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    private let car: CarStruct
    private let carManager: CarManager
    
    init(view: DetailViewProtocol, car: CarStruct, carManager: CarManager = CarManager()) {
        self.view = view
        self.car = car
        self.carManager = carManager
    }
    
    var bodyTypes: [String] {
        return carManager.getAllBodyTypeNames(for: car)
    }
    func viewDidLoad() {
        view?.displayCarBodyTypes()
        if let defaultBodyType = bodyTypes.first {
            if let info = carManager.getBodyTypeInfo(for: car, byName: defaultBodyType) {
                view?.displayPrice(price: info.price)
                view?.displayImage(imageName: info.photo)
            }
        }
    }
    
    func didSelectBodyType(at index: Int) {
        let selectedBodyType = bodyTypes[index]
        if let info = carManager.getBodyTypeInfo(for: car, byName: selectedBodyType) {
            view?.displayPrice(price: info.price)
            view?.displayImage(imageName: info.photo)
        }
    }
    
    func calculatePrice() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            let defaultBodyType = self.bodyTypes.first!
            if let info = self.carManager.getBodyTypeInfo(for: self.car, byName: defaultBodyType) {
                DispatchQueue.main.async {
                    self.view?.displayPrice(price: info.price)
                    self.view?.displayImage(imageName: info.photo)
                }
            }
        }
    }
}
