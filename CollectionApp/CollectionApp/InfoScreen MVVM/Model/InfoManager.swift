import Foundation

// MARK: - Properties and init()
final class InfoManager {
    lazy var dogInformation: [InfoStruct] = []
    private let storage = NetworkingService()
    
    init() {
     loadInfo()
    }
}

// MARK: - load from JSON-file
private extension InfoManager {
    func loadInfo() {
        dogInformation = storage.loadAndParseJSON() ?? []
    }
}

