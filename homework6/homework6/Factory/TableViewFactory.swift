import UIKit

final class TableViewFactory {
    static func createTableView(nib: String, cellIdentifier: String) -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = ColorEnum.accentBackground
        let nib = UINib(nibName: nib, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }
}
