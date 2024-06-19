import Foundation

struct NetworkingService {
    func loadAndParseJSON() -> [CarStruct]? {
        guard let url = Bundle.main.url(forResource: "Cars", withExtension: "json") else {
            print("Error: Unable to find JSON file.")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode([CarStruct].self, from: data)
        } catch {
            print("Error loading and decoding data: \(error)")
            return nil
        }
    }
}
