import Foundation

// MARK: - Properties and init()
final class CarManager {
    private(set) var carCatalog: [CarStruct] = []
    private let storage = NetworkingService()
    
    init() {
        loadInfo()
    }
}

// MARK: - load from JSON-file
private extension CarManager {
    func loadInfo() {
        carCatalog = storage.loadAndParseJSON() ?? []
    }
}

extension CarManager {
    func getAllBodyTypeNames(for car: CarStruct) -> [String] {
            return Array(car.bodyTypes.keys)
        }
    
    func getAllBodyTypeNames() -> [String] {
        var allBodyTypeNames: [String] = []
        for car in carCatalog {
            allBodyTypeNames.append(contentsOf: car.bodyTypes.keys)
        }
        return allBodyTypeNames
    }
}

extension CarManager {
    func getBodyTypeInfo(for car: CarStruct, byName name: String) -> CarBodyTypeInfo? {
        return car.bodyTypes[name]
    }
    
    func getBodyTypeInfo(byName name: String) -> CarBodyTypeInfo? {
        for car in carCatalog {
            if let bodyType = car.bodyTypes[name] {
                return bodyType
            }
        }
        return nil
    }
}
