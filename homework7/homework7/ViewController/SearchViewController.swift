import UIKit

class SearchViewController: UIViewController {
    private let searchView = SearchView()
    private let tableViewDataSource = ImageTableViewDataSource()
    private let tableViewDelegate = ImageTableViewDelegate()
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension SearchViewController {
    func setupView() {
        setupTableView()
        searchView.configureText(searchPlaceholder: "What I need to find?")
    }
    
    func setupTableView() {
        searchView.setDelegate(tableViewDelegate)
        searchView.setDataSource(tableViewDataSource)
    }
}
