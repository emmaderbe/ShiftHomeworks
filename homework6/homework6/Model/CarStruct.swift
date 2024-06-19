import Foundation

struct CarStruct: Codable {
    let brand, emblem: String
    let bodyTypes: [String: CarBodyTypeInfo] 
}

struct CarBodyTypeInfo: Codable {
    let price, photo: String
}
