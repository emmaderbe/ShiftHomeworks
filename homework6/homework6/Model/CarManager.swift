import Foundation

protocol CarManagerProtocol {
    var carCatalog: [CarStruct] { get }
    func getSortedBodyTypes(for car: CarStruct) -> [String]
    func getBodyTypeDetails(for car: CarStruct, byName name: String) -> (price: String, photo: String)?
}

final class CarManager: CarManagerProtocol {
    private(set) var carCatalog: [CarStruct] = []
    private let storage = NetworkingService()
    
    init() {
        loadInfo()
    }
    
    private func loadInfo() {
        carCatalog = storage.loadAndParseJSON() ?? []
    }
    
    func getSortedBodyTypes(for car: CarStruct) -> [String] {
        return Array(car.bodyTypes.keys).sorted()
    }
    
    func getBodyTypeDetails(for car: CarStruct, byName name: String) -> (price: String, photo: String)? {
        guard let bodyTypeInfo = car.bodyTypes[name] else { return nil }
        return (price: bodyTypeInfo.price, photo: bodyTypeInfo.photo)
    }
 
}
