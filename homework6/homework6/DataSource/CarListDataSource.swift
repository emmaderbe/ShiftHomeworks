import UIKit

final class CarListDataSource: NSObject, UITableViewDataSource {
    private lazy var carCatalog = CarManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carCatalog.carCatalog.first?.cars.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifier, for: indexPath) as? CarListTableViewCell,
              let car = carCatalog.carCatalog.first?.cars[indexPath.row]
        else { return UITableViewCell() }
        cell.configureView(with: car)
        return cell
    }
}
