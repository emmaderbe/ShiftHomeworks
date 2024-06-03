import UIKit

protocol ImageLoaderProtocol {
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}

final class ImageLoader: NSObject, ImageLoaderProtocol {
    private var completions: [URL: (UIImage?) -> Void] = [:]
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "homework7")
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        completions[url] = completion
        let task = session.downloadTask(with: url)
        task.resume()
    }
}

extension ImageLoader: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let url = downloadTask.originalRequest?.url else { return }
        
        guard let data = try? Data(contentsOf: location) else { return }
        let image = UIImage(data: data)
        
        DispatchQueue.main.async {
            self.completions[url]?(image)
            self.completions[url] = nil
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error, let url = task.originalRequest?.url {
            print("Failed to download image from \(url): \(error.localizedDescription)")
            DispatchQueue.main.async {
                self.completions[url]?(nil)
                self.completions[url] = nil
            }
        }
    }
}
