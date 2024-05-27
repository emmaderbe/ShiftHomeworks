import UIKit

class CarListView: UIView {
    private let titleLabel = LabelFactory.createTitleLabel()
    private let tableView = TableViewFactory.createTableView()
    
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

private extension CarListView {
    func setupView() {
        backgroundColor = ColorEnum.accentBackground
        addSubview(titleLabel)
        addSubview(tableView)
        
        tableView.register(CarListTableViewCell.self, forCellReuseIdentifier: CarListTableViewCell.identifier)
    }
}

private extension CarListView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension CarListView {
    func configureText(title: String) {
        titleLabel.text = title
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension CarListView {
    func setDataSource(_ dataSource: CarListDataSource) {
        tableView.dataSource = dataSource
    }
    
//    func setDelegates(_ delegate: CarListDelegate) {
//        tableView.delegate = delegate
//    }
}
