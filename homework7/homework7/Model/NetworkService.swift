import Foundation

protocol NetworkServiceProtocol {
    var results: [PhotoResult] { get }
    func fetchPhotos(query: String, completion: @escaping (Result<[PhotoResult], Error>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case clientError
    case serverError
    case noResults
    case unknown
}

final class NetworkService: NetworkServiceProtocol {
    private(set) var results: [PhotoResult] = []
    private let apiKey = KeyStruct.key
    private let urlSession = URLSession.shared
}

private extension NetworkService {
    func makeRequest(query: String) -> URLRequest? {
        var urlComponents = URLComponents(string: "https://api.unsplash.com/search/photos")
        let queryItems = [
            URLQueryItem(name: "per_page", value: "1"),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "orientation", value: "landscape"),
            URLQueryItem(name: "client_id", value: apiKey)
        ]
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            return nil
        }
        
        return URLRequest(url: url)
    }
}

extension NetworkService {
    func fetchPhotos(query: String, completion: @escaping (Result<[PhotoResult], Error>) -> Void) {
        guard let request = makeRequest(query: query) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = urlSession.dataTask(with: request) { [weak self] data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.unknown))
                return
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                if let data = data {
                    do {
                        let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                        DispatchQueue.main.async {
                            self?.results = jsonResult.results
                            if jsonResult.results.isEmpty {
                                completion(.failure(NetworkError.noResults))
                            } else {
                                completion(.success(jsonResult.results))
                            }
                        }
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NetworkError.unknown))
                }
            case 400...499:
                completion(.failure(NetworkError.clientError))
            case 500...599:
                completion(.failure(NetworkError.serverError))
            default:
                completion(.failure(NetworkError.unknown))
            }
        }
        task.resume()
    }
}
