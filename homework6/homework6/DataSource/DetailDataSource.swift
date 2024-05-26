import UIKit

final class DetailDataSource: NSObject, UITableViewDataSource {
    private lazy var bodyTypes: [String: BodyType] = [:]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bodyTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell
        else { return UITableViewCell() }        
        return cell
    }
}

