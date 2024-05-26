import Foundation

// MARK: - Properties and init()
final class CarManager {
    private(set) var carCatalog: [CarCatalogStruct] = []
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
