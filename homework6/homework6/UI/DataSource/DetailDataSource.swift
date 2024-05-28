import UIKit

final class DetailDataSource: NSObject, UITableViewDataSource {
    private var bodyTypes: [String] = []
    private var selectedIndex: Int?
}

extension DetailDataSource {
    func updateBodyTypes(_ bodyTypes: [String]) {
        self.bodyTypes = bodyTypes
    }
    
    func selectBodyType(at index: Int) {
        self.selectedIndex = index
    }
}

extension DetailDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bodyTypes.count
    }
}

extension DetailDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        let bodyType = bodyTypes[indexPath.row]
        let isSelected = (indexPath.row == selectedIndex)
        cell.configureView(with: bodyType, isSelected: isSelected)
        return cell
    }
}
