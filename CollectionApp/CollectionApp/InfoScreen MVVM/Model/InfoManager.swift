import Foundation

final class InfoManager {
    lazy var dogInformation: [InfoStruct] = []
    private let storage = NetworkingService()
    
    init() {
     loadInfo()
    }
    
    private func loadInfo() {
        dogInformation = storage.loadAndParseJSON() ?? []
    }
}

