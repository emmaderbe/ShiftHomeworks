import UIKit

protocol ImageLoaderProtocol {
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}

final class ImageLoader: ImageLoaderProtocol {
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
       let task = URLSession.shared.dataTask(with: url) { data, response, error in
           if let data = data, let image = UIImage(data: data) {
               DispatchQueue.main.async {
                   completion(image)
               }
           } else {
               DispatchQueue.main.async {
                   completion(nil)
               }
           }
       }
       task.resume()
   }
}

