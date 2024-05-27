import UIKit

protocol CarListDelegateProtocol: AnyObject {
    func carSelected(at index: Int)
}

final class CarListDelegate: NSObject, UITableViewDelegate {
    private var cars: [CarStruct] = []
    weak var delegate: CarListDelegateProtocol?
}

extension CarListDelegate {
    func updateCars(_ cars: [CarStruct]) {
        self.cars = cars
    }
}

extension CarListDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < cars.count else {
            print("Index out of range")
            return
        }
        delegate?.carSelected(at: indexPath.row)
    }
}
