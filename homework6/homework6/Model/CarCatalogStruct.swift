import Foundation

struct CarCatalogStruct: Codable {
    let cars: [Car]
}

struct Car: Codable {
    let brand: String
    let emblem: String
    let bodyTypes: [String: BodyType]
}

struct BodyType: Codable {
    let price: String
    let photo: String
}
