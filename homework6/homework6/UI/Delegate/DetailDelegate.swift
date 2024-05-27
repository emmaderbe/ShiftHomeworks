import UIKit

protocol DetailDelegateProtocol: AnyObject {
    func bodyTypeSelected(at index: Int)
}

final class DetailDelegate: NSObject, UITableViewDelegate {
    private var bodyTypes: [String] = []
    weak var delegate: DetailDelegateProtocol?
    
    func updateBodyTypes(_ bodyTypes: [String]) {
        self.bodyTypes = bodyTypes
    }
}

extension DetailDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < bodyTypes.count else {
            print("Index out of range")
            return
        }
        delegate?.bodyTypeSelected(at: indexPath.row)
    }
}
