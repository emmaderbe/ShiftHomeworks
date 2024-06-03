import Foundation

struct APIResponse: Codable {
    let total, totalPages: Int
    let results: [PhotoResult]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct PhotoResult: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let full: String
}
