import UIKit

//MARK: - Properties
class DogListViewController: UIViewController {
    private let  dataSource = DogListCollectionDataSource()
    private let delegate = DogListCollectionDelegate()
    
    private lazy var contentView: DogListCollectionView = {
        let view = DogListCollectionView()
        view.setDataSource(dataSource)
        view.setDelegates(delegate)
        return view
    }()
    
//MARK: - vc lifecycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        delegate.delegate = self
    }
}

extension DogListViewController: DogSelectionDelegate {
    func dogSelected(_ dog: DogListData) {
        let detailVC = DetailViewController()
        let presenter = DetailPresenter(view: detailVC, dogData: dog)
        detailVC.presenter = presenter
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

