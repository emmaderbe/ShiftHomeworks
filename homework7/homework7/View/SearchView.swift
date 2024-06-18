import UIKit

protocol SearchViewDelegate: AnyObject {
    func selectSeachBar(with text: String)
}

class SearchView: UIView {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    weak var delegate: SearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchView {
    func setupView() {
        backgroundColor = .white
        addSubview(searchBar)
        addSubview(tableView)
        
        searchBar.delegate = self
    }
}

private extension SearchView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ConstraintsEnum.topConstraint),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstraintsEnum.leadingConstraint),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ConstraintsEnum.trailingConstraint),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: ConstraintsEnum.topConstraint),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

private extension SearchView {
    func clearSearchBar() {
        searchBar.text = ""
    }
}

extension SearchView {
    func configureText(searchPlaceholder: String) {
        searchBar.placeholder = searchPlaceholder
    }
}

extension SearchView {
    func setDataSource(_ dataSource: ImageTableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func setDelegate(_ delegate: ImageTableViewDelegate) {
        tableView.delegate = delegate
    }
    
    func reloadTableView() {
        tableView.reloadData()
        clearSearchBar()
        self.endEditing(true)
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty {
            delegate?.selectSeachBar(with: text)
        }
    }
}
