import Foundation

protocol InfoManagerProtocol {
    var dogInformation: [InfoStruct] { get }
}

// MARK: - Properties and init()
final class InfoManager: InfoManagerProtocol {
    private(set) lazy var dogInformation: [InfoStruct] = []
    private let storage = NetworkingService()
    
    init() {
        load()
    }
}

// MARK: - load from JSON-file
private extension InfoManager {
    func load() {
        dogInformation = storage.loadAndParseJSON() ?? []
    }
}

