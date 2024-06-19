import UIKit

final class CarListDataSource: NSObject, UITableViewDataSource {
    private var cars: [CarStruct] = []
}

extension CarListDataSource {
    func updateCars(_ cars: [CarStruct]) {
        self.cars = cars
    }
}

extension CarListDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
}

extension CarListDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifier, for: indexPath) as? CarListTableViewCell
        else { return UITableViewCell() }
        let car = cars[indexPath.row]
        cell.configureView(with: car)
        return cell
    }
}
