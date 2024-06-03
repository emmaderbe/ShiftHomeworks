import UIKit

final class ImageTableViewDataSource: NSObject, UITableViewDataSource {
    private var results: [PhotoResult] = []
    private var imageLoader: ImageLoaderProtocol?
}

extension ImageTableViewDataSource {
    func addResults(_ newResults: [PhotoResult]) {
        results.append(contentsOf: newResults)
    }
    
    func setupLoader(_ loader: ImageLoaderProtocol) {
        self.imageLoader = loader
    }
}

extension ImageTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell
        else {return UITableViewCell()}
        let imageURLString = results[indexPath.row].urls.full
        if let url = URL(string: imageURLString) {
            imageLoader?.loadImage(from: url, completion: { image in
                cell.configure(with: image)
            })
        }
        return cell
    }
}

