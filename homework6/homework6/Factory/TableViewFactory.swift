import UIKit

final class TableViewFactory {
    static func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = ColorEnum.accentBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
}
