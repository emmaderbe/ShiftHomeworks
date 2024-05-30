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

//MARK: - navigation to detail screen
extension DogListViewController: DogSelectionDelegate {
    func dogSelected(_ dog: DogListData, at index: Int) {
        let viewController = setupViewControllerToPush(dog: dog, index: index)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

private extension DogListViewController {
    func setupViewControllerToPush(dog: DogListData, index: Int) -> UIViewController {
        let presenter = DetailPresenter(dogData: dog, index: index)
        let detailVC = DetailViewController(presenter: presenter)
        return detailVC
    }
}

