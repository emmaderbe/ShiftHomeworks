import UIKit

final class CarListDataSource: NSObject, UITableViewDataSource {
    private var cars: [CarStruct] = []
    
    func updateCars(_ cars: [CarStruct]) {
        self.cars = cars
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifier, for: indexPath) as? CarListTableViewCell
        else { return UITableViewCell() }
        let car = cars[indexPath.row]
        cell.configureView(with: car)
        return cell
    }
}
